Feature: Get Json from API

  Background:
    Given url 'https://reqres.in/api/'

  #@smoke
  Scenario: Get single a user
    And path 'users/2'
    When method GET
    Then status 200
    Then match response.data.last_name == "Weaver"
    Then print response.data.last_name

  #@smoke
  Scenario Outline: Create an user
    And path 'api/users'
    When request {"name": <name>,"job": <job>}
    When method POST
    Then status 201
    Then print '\n',response

    Examples:
      | name  | job  |
      | cw119 | king |