Feature: register user

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/user/register'
    * def bodyRequest =
    """
    {
      email: "#('karate1' + Date.now() + '@email.com')",
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
