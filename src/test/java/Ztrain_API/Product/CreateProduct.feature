Feature: Create product

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * path '/product/create'
    * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMzlhZGNhZmJjNGMyMTE0ZmYwYWQ3NiIsImlhdCI6MTY0ODY0MjM5NiwiZXhwIjoxNjQ4NzI4Nzk2fQ.yQUdX1eTuORqSXyx3'

  @TEST_OF-714
  Scenario Outline: Test the create product api call with invalid parameters
    * def productRq =
    """
    {
      name: "<name>",
      description: "<description>",
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
      |name                       |description                                                                                    |image             |price |
      |Samsung                    |This is a description for the smartphone samsung galaxy S8+ worth more than hundred characters |https://image.jpg |300   |
      |house of clotches Cameroon |Description of house                                                                           |https://image.jpg |150   |


