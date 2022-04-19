Feature: add comment on product

  Background:
    * url base_url
    * path '/product/comments/add'

    @TEST_OF-740
    Scenario Outline: Test the call of the api add comment to product with invalid parameters
    * def BodyRq = { product_id: '#(product + "<product_id>")', user_id: '#(authInfo.user + "<user_id>")', message: '<message>' }
    Given request BodyRq
    And header Authorization = 'Bearer ' + <token>
    When  method POST
    Then match [201, 400, 401, 402] contains responseStatus
    And print response

      Examples:
        |token                  |product_id |user_id |message            |
        |authInfo.token         |false      |        |Comment of product |
        |authInfo.token + 'NTW' |           |        |Comment of product |
        |authInfo.token         |           |false   |Comment of product |
        |authInfo.token         |           |        |                   |
        |authInfo.token         |           |        |Comment of product |