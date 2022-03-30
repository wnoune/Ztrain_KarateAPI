Feature: Create product

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/product/create'
    * header Authorization = 'Bearer ' + authInfo.token

  @TEST_OF-719
  Scenario Outline: Test the create product api call with invalid parameters
    * def productRq =
    """
    {
      name: "<name>",
      description: "<description>",a
      image: <image>,
      price: <price>
    }
    """
    Given request productRq
    And header content-type = 'application/JSON'
    When method POST
    And print response
    Then match karate.range(400, 499) contains responseStatus

    Examples:
      |name                       |description                                                                                    |image             |price  |
      |Samsung                    |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image.jpeg |300   |
      |house of clotches Cameroon |Description of house                                                                           |https://image.jpeg |15.39 |
      |house of clotches Cameroon |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image      |-150  |
      |Samsung                    |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image      |-200  |

  @TEST_OF-720
  Scenario: Test the create product api call with valid parameters
    * def bodyRq =
    """
    {
      name: "#('Smartphone samsung galaxy S8+' +  Date.now())",
      description: "This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters, Smartphone samsung galaxy S8+",
      image: "https://image.jpeg",
      price: 300
    }
    """
    Given request bodyRq
    When method POST
    Then status 201
    And print response

