Feature: Add Main Plans

  Background:
    Given url 'https://api.dev.insurepro.com/api'

  #@smoke
  Scenario: Create an user
    And path '/main-plan'
    And request {"name":"General Liability","description":"+91-7206561636","estimatedCost":23}
    When method POST
    Then status 200
    And print response