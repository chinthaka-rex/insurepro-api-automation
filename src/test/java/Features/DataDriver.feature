Feature: Data Driver test 1

  Background:
    Given url 'https://api.instantwebtools.net/v1/'

  #@smoke
  Scenario Outline: Create an user using csv row : <id>
    And path 'passenger'
    And request {"name": <name>,"trips": <trips>,"airline": <airline>}
    When method POST
    Then status 200
    * def result = response

    Given path 'passenger/'+ result._id
    When method GET
    Then status 200
    Then match response._id == result._id
    And match response.name == "<name>"
    And match response.trips == <trips>

    Examples:
      | read('file:testdata/combinations.csv') |