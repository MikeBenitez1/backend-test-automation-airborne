# backend-test-automation-airborne
Basic backend API test automation project with Airborne (RSpec driven framework).



## Setup
* You just need to get your personal API token from https://todoist.com/app/settings/integrations 
 and paste it in a keys.env file in /config folder:
 
 ```
 e.g VALID_TOKEN = 1111010101gdgdgd88
 ```
 
 * Then export the keys.env file with env variables with this command from terminal:
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
