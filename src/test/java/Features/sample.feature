Feature: Get Json from API

  Background:
    Given url 'https://gorest.co.in/public/v2/posts/'

  @Smoke
  Scenario: get posts details1
    And path 9996655
    When method GET
    Then status 404

  Scenario: get posts details2
    And path 2062
    When method GET
    Then status 200
    Then match 4118 == response.user_id
    * print response
