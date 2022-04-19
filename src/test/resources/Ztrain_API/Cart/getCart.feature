Feature: get cart

  Background:
    * url base_url
    * path 'cart'

  @TEST_OF-760
  Scenario Outline: Test the get all product user to cart api
    Given path <user_id>
    And header Authorization = 'Bearer ' + <token>
    When  method GET
    Then match [200, 400, 401, 404] contains responseStatus
    And print response

    Examples:
      |token                  |user_id                |
      |authInfo.token + 'NTW' |authInfo.user          |
      |authInfo.token         |authInfo.user + 'KEMS' |
      |authInfo.token         |authInfo.user          |


