Feature: Users PetStore

  Background:
    * url baseURL
    * def createUserRequestFilePath = "jsonpayload/createUserRequest.json"
    * def createUserResponseFilePath = "jsonpayload/createUserResponse.json"
    * def getUserResponseFilePath = "jsonpayload/getUserResponse.json"
    * def testUser = 'Naia'
    * def testFirstName = 'Bañó'
    * def testLastName = 'Rodríguez'
    * def testEmail = 'naia@gmail.com'
    * def testPassword = '9876'
    * def testPhone = '+09235132'
    * def testId = 8

  Scenario: Create an user
    Given path '/user'
    And def reqBody = read(createUserRequestFilePath)
    And def resBody = read(createUserResponseFilePath)
    And set reqBody
      | path       | value         |
      | username   | testUser      |
      | firstName  | testFirstName |
      | lastName   | testLastName  |
      | email      | testEmail     |
      | phone      | testPhone     |
      | password   | testPassword  |
      | id         | testId        |
      | userStatus | 1             |
    And request reqBody
    When method POST
    Then status 200
    And match response == resBody
    And print response

  Scenario: Get the created user
    Given path '/user/'+testUser
    And def resBody = read(getUserResponseFilePath)
    When method GET
    Then status 200
    And match response == resBody
    And match $.username == testUser
    And match $.firstName == testFirstName
    And match $.lastName == testLastName
    And match $.phone == testPhone
    And match $.email == testEmail
    And match $.id == testId
    And print response