Feature: Get Json from API2

  Scenario: get posts details3
    Given url 'https://gorest.co.in/public/v2/posts/'
    And path 2071
    When method GET
    Then status 200
