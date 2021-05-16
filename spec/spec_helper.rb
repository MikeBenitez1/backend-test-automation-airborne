require 'airborne'
require 'rspec'
require 'coderay'
require 'rspec_html_reporter'
require 'airborne_report'

Airborne.configure do |config|
  config.base_url = 'https://api.todoist.com/rest/v1/tasks'
  config.headers = { Authorization: 'Bearer xxxxx' }
  config.verify_ssl = false
end

