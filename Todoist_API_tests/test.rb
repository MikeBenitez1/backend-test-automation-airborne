# POST requests
describe 'POST_create_a_new_task' do

  body = { content: 'Buy Milk and Rice',
           due_string: 'tomorrow at 12:00',
           due_lang: 'en',
           priority: 4 }

  it 'Validate status code is 2xx' do
    post '',
         body
    expect_status 200
    # Improve approach to avoid global variables
    $task_id = json_body[:id]
  end

  it 'Validate task name is correct' do
    get "/#{$task_id}"
    expect_json(content: 'Buy Milk and Rice')
  end
end

# GET requests
describe 'GET_active_task' do

  it 'Validate status code is 2xx' do
    get "/#{$task_id}"
    expect_status 200
  end

  it 'Validate JSON schema' do
    get "/#{$task_id}"
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
    delete "/#{$task_id}",
           { body: :null }
    expect_status 204
  end

end

