Feature: Submit cart

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/command/create'
    * def result = call read('classpath:Ztrain_API/Cart/addCart.feature@TEST_OF-728')

  @TEST_OF-734
  Scenario Outline: Test the submit command api call with invalid parameters
    * def BodyRq =
    """
    {
      "user_id": '#(authInfo.user + "<userID>")',
      "address": "Douala Bonamoussadi",
      "card": {
        "number": "<number>",
        "exp_month": "<exp_month>",
        "exp_year": "<exp_year>",
        "cvc": <cvc>,
      }
    }
    """
    Given header Authorization = 'Bearer ' + <token>
    And request BodyRq
    When method POST
    And print response
    Then match [201, 400, 401, 402] contains responseStatus

    Examples:
        |token                  |userID   |number         |exp_month  |exp_year |cvc |
        |authInfo.token + 'NTW' |         |42424242424242 |1          |2023     |314 |
        |authInfo.token         |azerty   |42424242424242 |1          |2023     |314 |
        |authInfo.token         |         |42424242424242 |1          |2023     |314 |
        |authInfo.token         |         |42424242       |1          |2023     |314 |
        |authInfo.token         |         |42424242424242 |-1         |2023     |314 |
