require 'amocrm-rails'

AmocrmRails.setup do |config|
  config::Request.timeout = 60
  config::Request.open_timeout = 60
  config::Request.symbolize_keys = true
  config::Request.debug = false
end