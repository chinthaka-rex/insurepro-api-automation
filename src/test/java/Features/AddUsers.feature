Feature: Add User Details

  Background:
    Given url 'https://api.dev.insurepro.com/api'

  Scenario Outline: Create an user with valid details <id>
    And path '/user'
    Then def userRequest =
    """
    {
    "legalName":<legalName>,
    "email":<email>,
    "phone":<phone>,
    "dob":<dob>,
    "zip":<zip>,
    "gender":<gender>,
    "address":<address>,
    "apartmentNo":<apartmentNo>,
    "exprience":<exprience>,
    "jobType":<jobType>,
    "JobsPerMonth":<JobsPerMonth>,
    "claim":<claim>
    }
    """
    And request userRequest
    When method POST
    Then status 200
    And print response
    Examples:
      | read('file:testdata/users.csv') |

  Scenario: Create an user with existing email address
    And path '/user'
    Then def userRequest =
    """
    {
    "legalName":"Chi",
    "email":"trinoorsrex@sufix.com",
    "phone":"+94774190017",
    "dob":"01-01-1998",
    "zip":"79601",
    "gender":1,
    "address":"1301 North Judge Ely Blvd",
    "apartmentNo":"2178",
    "exprience":"123",
    "jobType":"House cleaning",
    "JobsPerMonth":"23",
    "claim":true
    }
    """
    And request userRequest
    When method POST
    Then status 400
    And print response