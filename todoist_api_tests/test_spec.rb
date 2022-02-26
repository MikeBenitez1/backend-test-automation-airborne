# POST requests
describe 'POST create a new task', regression: true do
  body = { content: 'Buy Milk and Rice',
           due_string: 'tomorrow at 12:00',
           due_lang: 'en',
           priority: 4 }

  it 'Validate status code is 2xx' do
    post '/rest/v1/tasks', body
    expect_status 200
    # Improve approach to avoid global variables
    $task_id = json_body[:id]
  end

  it 'Validate task name is correct' do
    get "/rest/v1/tasks/#{$task_id}"
    expect_json(content: 'Buy Milk and Rice')
  end

end

# GET requests
describe 'GET active task', regression: true do

  it 'Validate status code is 2xx' do
    get "/rest/v1/tasks/#{$task_id}"
    expect_status 200
  end

  it 'Validate JSON schema' do
    get "/rest/v1/tasks/#{$task_id}"
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
describe 'DELETE active task', regression: true do

  it 'Validate status code is 2xx' do
    delete "/rest/v1/tasks/#{$task_id}", { body: :null }
    expect_status 204
  end

end

