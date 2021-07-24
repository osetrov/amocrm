require 'amocrm'

AmocrmRails.setup do |config|
  if File.exist?('config/amocrm.yml')
    processed = YAML.load_file('config/amocrm.yml')[Rails.env]

    processed.each do |k, v|
      config::register k.underscore.to_sym, v
    end

    if File.exist?('config/amocrm_token.yml')
      token_data = YAML.load_file("config/amocrm_token.yml")
      token_data.each do |k, v|
        config::register k.underscore.to_sym, v
      end
    end

    config::Request.timeout = 60
    config::Request.open_timeout = 60
    config::Request.symbolize_keys = true
    config::Request.debug = false
  end
end