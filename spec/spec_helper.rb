require 'airborne'
require 'dotenv'
require 'rspec'
require 'coderay'
require 'rspec_html_reporter'
require 'airborne_report'
require 'require_all'

require_all './config'


Config.load_environment
Config.load_config_file!

# Global configurations
Airborne.configure do |config|
  config.base_url = 'https://api.todoist.com/rest/v1/tasks'
  config.headers = { Authorization: "Bearer #{Config.tokens_values['valid_token']}" }
  config.verify_ssl = false
end

