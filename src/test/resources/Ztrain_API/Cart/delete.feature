Feature: Delete products to cart
  
  Background: 
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/cart/delete'

  @TEST_OF-753
  Scenario: Test the api call delete specific product to cart with valid parameters
    * def result = call read('classpath:Ztrain_API/Cart/addCart.feature@TEST_OF-728')
    Given header Authorization = 'Bearer ' + authInfo.token
    And request { product: '#(product)', user_id: '#(authInfo.user)' }
    When  method DELETE
    Then match response.message == 'product remove cart successfully'
    And print response

  @TEST_OF-756
  Scenario Outline: Test the api call delete specific product to cart with invalid parameters
    * def result = call read('classpath:Ztrain_API/cart/addCart.feature@TEST_OF-728')
    Given header Authorization = 'Bearer ' + <token>
    And request { product_id: '#(product+ "<product_id>" )', user_id: '#(authInfo.user+ "<user_id>")' }
    When method DELETE
    Then match response == { statusCode: '#present', message: '#present', error: #present }
    And print response

    Examples:
      |token                  |user_id       |product_id |
      |authInfo.token + 'NTW' |              |           |
      |authInfo.token         |KEMS          |           |
      |authInfo.token         |              |product    |


  @TEST_OF-766
  Scenario Outline: Test the delete all product user to cart api
    * def result = call read('classpath:Ztrain_API/Cart/addCart.feature@TEST_OF-728')
    Given path <user_id>
    And header Authorization = 'Bearer ' + <token>
    When  method DELETE
    Then status 200
    And print response

    Examples:
      |token                  |user_id       |
      |authInfo.token         |authInfo.user |

