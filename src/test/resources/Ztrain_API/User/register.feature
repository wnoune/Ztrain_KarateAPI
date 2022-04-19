Feature: register user

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/user/register'
    * def bodyRequest =
    """
    {
      email: "#('admin' + Date.now() + '@test.com')",
      password: "12345678",
      adress: "Douala Bonamoussadi",
      age: 26
    }
    """

  @TEST_OF-711
  Scenario: Test the compliance of the register user api call status code with valid parameters
    Given request bodyRequest
    When method POST
    Then status 201
    And print response

  @TEST_OF-713
  Scenario: Test the compliance of the response when calling the register user api with the valid required parameters
    Given request bodyRequest
    When method POST
    Then match response == { user: '#present', token: '#present' }
    And print response

  @TEST_OF-714
  Scenario Outline: Test the compliance of the response when calling the register user api with the invalid required parameters
    * def query =
    """
    {
      email: "<email>",
      password: "<password>",
      adress: "<address>",
      age: <age>
    }
    """
    Given request query
    And header content-type = 'application/JSON'
    When method POST
    And print response
    Then match response == { statusCode: '#present', message: '#present', error: #present }

      Examples:
        |email        |password |address |age |
        |emailfake    |gggg     |7854    |dix |
        |ne2@test.com |gggg     |Mbanga  |10  |
        |ne2@test.com |12345678 |Mbanga  |dix |
        |emailfake    |12345678 |Mbanga  |10  |

  @TEST_OF-715
  Scenario Outline: Test the compliance of the register user api call status code with invalid parameters
    * def query =
    """
    {
      email: "<email>",
      password: "<password>",
      adress: "<address>",
      age: <age>
    }
    """
    Given request query
    When method POST
    Then match response == { statusCode: '#present', message: '#present', error: #present }

    Examples:
      |email        |password |address |age |
      |emailfake    |gggg     |7854    |dix |
      |ne2@test.com |gggg     |Mbanga  |10  |
      |ne2@test.com |12345678 |Mbanga  |dix |
      |emailfake    |12345678 |Mbanga  |10  |

  @TEST_OF-726
  Scenario: Test the creation of an existing user
    Given request bodyRequest
    When method POST
    Then status 201
    And print response
