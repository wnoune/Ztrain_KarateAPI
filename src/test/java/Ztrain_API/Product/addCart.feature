Feature: Add product to card

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/cart/add'


  @TEST_OF-728
  Scenario: Test the call of the api add product to cart with valid parameters
    * def quantity_add = 1
    Given request { product: '#(product)', user_id: '#(authInfo.user)', quantity: #(quantity_add)}
    And header Authorization = 'Bearer ' + authInfo.token
    When method POST
    Then status 201
    And print response
