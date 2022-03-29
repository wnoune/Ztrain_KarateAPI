Feature: Ztrain API Automation

  Background:
    * url 'https://ztrain-shop.herokuapp.com'
    * header Accept = 'application/json'
    * header Authorization = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMGY1NjFhZTgyNmJjMGIxODMzMWE2ZSIsImlhdCI6MTY0ODEzMzg4MCwiZXhwIjoxNjQ4MjIwMjgwfQ.ylkbqCe7zefacqmJ6RsCItpRJnLFOrFmlVNCUfyMFjo'

  Scenario Outline: Login user
    Given path '/auth/login'
    And request {email:"<email>", password:"<password>"}
    When method POST
    And print response
    Then status 201

    Examples:
      |email         |password |
      |tester@test.com |12345678 |

  Scenario Outline: Register user
    Given path '/user/register'
    And request {email:"<email>", password:"<password>", adress:"<adress>", age:<age>}
    When method POST
    Then status 201

    Examples:
      |email           |password |adress        |age |
      |tester@test.com |12345678 |Douala logpom | 26 |

  Scenario Outline: Create product
    Given path '/product/create'
    And request {name:"<name>", description:"<description>", image:"<image>", price:<price>}
    When method POST
    Then status 201

    Examples:
      |name                        |description                                                                                                                                                                                                                              |image                                                                                        |price |
      |Samsung Galaxy Note 10 Plus |Le Samsung Galaxy Note10 Plus est un smartphone haut de gamme annoncé le 7 août 2019. Équipé du S Pen qui fait le succès de la gamme, il est équipé d'un écran AMOLED de 6,3 pouces et d'un triple capteur photo de 12+16+12 mégapixels  |https://www.frandroid.com/produits/samsung/smartphones/600933-samsung-galaxy-note-10-pro.png |30000 |

  Scenario Outline: Add product to cart
    Given path '/cart/add'
    And request {product:"<product>", user_id:"<user_id>", quantity:<qty>}
    When method POST
    Then status 201

     Examples:
      |product                  |user_id                  |qty |
      |6239d9865484ea8439e99f8e |6239adcafbc4c2114ff0ad76 |10  |

  Scenario Outline: Update quantity product to cart
    Given path '/cart/update'
    And request {product:"<product>", user_id:"<user_id>", quantity:<qty>}
    When method PUT
    Then status 200"

    Examples:
      |product                  |user_id                  |qty |
      |6239d9865484ea8439e99f8e |6239adcafbc4c2114ff0ad76 |12   |

  Scenario Outline: Delete product to cart
    Given path '/cart/delete'
    And request {product:"<product>", user_id:"<user_id>", quantity:<qty>}
    When method DELETE
    And print response
    Then status 200"

    Examples:
      |product                  |user_id                  |qty |
      |6239d9865484ea8439e99f8e |6239adcafbc4c2114ff0ad76 |8   |

  Scenario Outline: Get all product user to cart
    Given path '/cart/:user_id'
    And request {}
    When method GET
    And print response
    Then status 200


  Scenario Outline: get cart
    Given path 'cart', '<user_id>'
    * method get
    * print response
    Then status 200

    Examples:
      | user_id                  |
      | 6239adcafbc4c2114ff0ad76 |
