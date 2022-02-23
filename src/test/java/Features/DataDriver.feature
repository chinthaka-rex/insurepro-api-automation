Feature: Data Driver test 1

  Background:
    Given url 'https://api.instantwebtools.net/v1/'

  @smoke
  Scenario Outline: Create an user using csv
    And path 'passenger'
    And request {"name": <name>,"trips": <trips>,"airline": <airline>}
    When method POST
    Then status 200
    And print '\n C Response : \n',response
    * def result = response

    Given path 'passenger/'+ result._id
    When method GET
    Then status 200
    Then print '\n G Response : \n',response
    Then match response._id == result._id
    And match response.name == "<name>"
    And match response.trips == <trips>

    Examples:
      | read('file:testdata/combinations.csv') |