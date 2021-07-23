require 'amocrm/amocrm_error'
require 'amocrm/request'
require 'amocrm/api_request'
require 'amocrm/response'

module Amocrm
  class << self
    def generate_access_token(client_id=Amocrm.client_id, client_secret=Amocrm.client_secret, refresh_token=nil, count=0)
      params = {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'authorization_code',
        redirect_uri: Amocrm.redirect_uri
      }
      if refresh_token.present?
        params[:refresh_token] = refresh_token
      else
        params[:code] = Amocrm.code
      end
      response = Faraday.post(Amocrm.url_token, params.to_json, "Content-Type" => "application/json")
      if response.status < 200 || response.status > 204
        response_token = JSON.parse(response.body)
        data = YAML.load_file("config/amocrm_token.yml")
        response_token.each do |k, v|
          data[k] = v
          Amocrm::register k.underscore.to_sym, v
        end
        File.open("config/amocrm_token.yml", 'w') { |f| YAML.dump(data, f) }
      elsif count < 3
        Amocrm.generate_access_token(client_id, client_secret, Amocrm.refresh_token, count+1)
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
      raise ArgumentError, "Unknown type: #{type}" unless Amocrm.const_defined?(klass)
      Amocrm.const_get(klass)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end
end
