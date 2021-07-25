require 'amocrm-rails/amocrm_error'
require 'amocrm-rails/request'
require 'amocrm-rails/api_request'
require 'amocrm-rails/response'

module AmocrmRails
  class << self
    def generate_access_token(client_id=AmocrmRails.client_id, client_secret=AmocrmRails.client_secret, refresh_token=nil, count=0)
      refresh_token ||= AmocrmRails.try(:refresh_token)
      params = {
        client_id: client_id,
        client_secret: client_secret,
      }
      if refresh_token.present?
        params[:grant_type] = 'refresh_token'
        params[:refresh_token] = refresh_token
      else
        params[:grant_type] = 'authorization_code'
        params[:code] = AmocrmRails.code
      end
      params[:redirect_uri] = AmocrmRails.redirect_uri
      response = Faraday.post(AmocrmRails.url_token, params.to_json, "Content-Type" => "application/json")
      if AmocrmRails::Request.debug
        logger = AmocrmRails::Request.logger || ::Logger.new(STDOUT)
        logger.info "---generate_access_token---"
        logger.info "params: #{params}"
        logger.info "Responding with #{response.status.inspect} => #{response.body.inspect}"
      end
      if response.status >= 200 && response.status <= 204
        response_token = JSON.parse(response.body)
        data = YAML.load_file("config/amocrm_token.yml")
        response_token.each do |k, v|
          data[k] = v
          AmocrmRails::register k.underscore.to_sym, v
        end
        File.open("config/amocrm_token.yml", 'w') { |f| YAML.dump(data, f) }
      elsif count < 3 && AmocrmRails.refresh_token.present?
        AmocrmRails.generate_access_token(client_id, client_secret, AmocrmRails.refresh_token, count+1)
      end
    end

    def setup
      yield self
    end

    def register(name, value, type = nil)
      cattr_accessor "#{name}_setting".to_sym

      add_reader(name)
      add_writer(name, type)
      send "#{name}=", value
    end

    def add_reader(name)
      define_singleton_method(name) do |*args|
        send("#{name}_setting").value(*args)
      end
    end

    def add_writer(name, type)
      define_singleton_method("#{name}=") do |value|
        send("#{name}_setting=", DynamicSetting.build(value, type))
      end
    end
  end

  class DynamicSetting
    def self.build(setting, type)
      (type ? klass(type) : self).new(setting)
    end

    def self.klass(type)
      klass = "#{type.to_s.camelcase}Setting"
      raise ArgumentError, "Unknown type: #{type}" unless AmocrmRails.const_defined?(klass)
      AmocrmRails.const_get(klass)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end
end
