Feature: Get Json from API

  Scenario: get posts details1
    Given url 'https://gorest.co.in/public/v2/posts/'
    And path 9996655
    When method GET
    Then status 404

  Scenario: get posts details2
    Given url 'https://gorest.co.in/public/v2/posts/'
    And path 2062
    When method GET
    Then status 200
