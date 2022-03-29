Feature: Login user

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/auth/login'

  @TEST_OF-704
  Scenario Outline: Test the compliance of the login api call status code with valid parameters
    Given request {email:"<email>", password:"<password>"}
    When method POST
    And print response
    Then status 201

    Examples:
      |email           |password |
      |tester@test.com |12345678 |

  @TEST_OF-705
  Scenario Outline: Test request failure when HTTP headers are invalid
    Given request {email:"<email>", password:"<password>"}
    And header content-type = 'application/xml'
    When method POST
    And print response
    Then status 400

    Examples:
      |email           |password |
      |tester@test.com |12345678 |

  @TEST_OF-706
  Scenario Outline: Test login api call with invalid required request body
    Given request {email:"<email>", password:"<password>"}
    And header content-type = 'application/JSON'
    When method POST
    And print response
    Then assert responseStatus == 400 || responseStatus == 401

    Examples:
      |email           |password     |
      |tester@test.com |23opujlllkjh |
      |tester@test.com |hddj         |
      |te@test.com     |hddj         |