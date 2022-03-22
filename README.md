# backend-test-automation-airborne
Personal basic project to practice API test automation with Airborne (RSpec driven framework https://github.com/brooklynDev/airborne) for https://todoist.com/app/ API.

![execution](https://user-images.githubusercontent.com/59778782/159395958-b857ec67-e0e6-49c9-91a5-e4b22dbcddff.gif)

## Getting Started
* You just need to get your personal API token from https://todoist.com/app/settings/integrations 
 and paste it in a `keys.env` file in `/config` folder in this format e.g: `VALID_TOKEN = 1111010101gdgdgd88`
 
 * Then export the `keys.env` file with this command from terminal:
```
export KEYS=keys
```


## Tests Execution
* To run the test by folder, spec or file use the following command:
```
rspec todoist_api_tests
```

* To run the test by tag name use the following command:
```
rspec todoist_api_tests --tag tag_name
```
