Feature: Add product to card

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/cart/add'
    * header Authorization = 'Bearer ' + authInfo.token

  @TEST_OF-719
  Scenario Outline: Test the call of the api add product to cart with valid parameters
    * def bodyRq =
    """
    {
      productId: "<product>",
      userId: "<user>",
      quantity: <quantity>,
    }
    """
    Given request bodyRq
    When method POST
    Then status 201
    And print response

    Examples:
      |product                  |user                     |quantity |
      |624463744db47f10408d5d67 |6239adcafbc4c2114ff0ad76 |5        |