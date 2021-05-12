require 'airborne'
require 'rspec'
require 'coderay'
require 'rspec_html_reporter'
require 'airborne_report'


verify_ssl = false
tasks_url = 'https://api.todoist.com/rest/v1/tasks'
auth = { Authorization: 'Bearer xxxxx' }

#Airborne.configure do |config|
  #config.base_url = 'https://api.todoist.com/rest/v1/tasks'
  # config.headers = { :Authorization => 'Bearer xxxxx' }
  # config.verify_ssl = false # equivalent to OpenSSL::SSL::VERIFY_NONE
#end

# POST requests
describe 'POST_create_a_new_task' do

  body = { content: 'Buy Milk and Rice',
           due_string: 'tomorrow at 12:00',
           due_lang: 'en',
           priority: 4 }

  it 'Validate status code is 2xx' do
    post tasks_url,
         body,
         auth,
         verify_ssl
    expect_status 200
    # Improve approach to avoid global variables
    $task_id = json_body[:id]
  end

  it 'Validate task name is correct' do
    get "#{tasks_url}/#{$task_id}",
        auth,
        verify_ssl
    expect_json(content: 'Buy Milk and Rice')
  end
end

# GET requests
describe 'GET_active_task' do

  it 'Validate status code is 2xx' do
    get "#{tasks_url}/#{$task_id}",
        auth,
        verify_ssl
    expect_status 200
  end

  it 'Validate JSON schema' do
    get "#{tasks_url}/#{$task_id}",
        auth,
        verify_ssl
    expect_json_types(comment_count: :integer,
                      completed: :boolean,
                      content: :string,
                      due: :object,
                      id: :integer,
                      order: :integer,
                      priority: :integer,
                      project_id: :integer,
                      section_id: :integer,
                      url: :string)
  end
end

# DELETE requests
describe 'DELETE_active_task' do

  it 'Validate status code is 2xx' do
    delete "#{tasks_url}/#{$task_id}",
           { body: :null },
           auth,
           verify_ssl
    expect_status 204
  end

end

