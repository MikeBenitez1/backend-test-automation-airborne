require 'airborne'
require 'dotenv'
require 'rspec'
require 'require_all'

require_all './config'

Config.load_environment
Config.load_config_file!

# Global configurations
Airborne.configure do |config|
  config.base_url = Config.base_urls['todoist_api']
  config.headers = { Authorization: "Bearer #{Config.tokens_values['valid_token']}" }
  config.verify_ssl = false
end

