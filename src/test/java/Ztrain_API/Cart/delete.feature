Feature: Delete products to cart
  
  Background: 
    * url base_url
    * path '/cart/delete'

  @TEST_OF-753
  Scenario: Test the api call delete specific product to cart with valid parameters
    * def result = call read('classpath:Ztrain_API/cart/addCart.feature@TEST_OF-728')
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
    Then match response.message == '<errorMessage>'
    And print response

    Examples:
      |token                  |user_id       |product_id |errorMessage          |
      |authInfo.token + 'NTW' |              |           |Unauthorized          |
      |authInfo.token         |KEMS          |           |cannot delete product |
      |authInfo.token         |              |product    |cannot delete product |


