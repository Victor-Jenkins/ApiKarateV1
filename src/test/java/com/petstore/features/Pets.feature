Feature: PetStore

  Background:
    * url baseURL
    * def petStatus = ['available','pending','sold']
    * def petUtils = Java.type('com.petstore.utils.PetUtils')

  Scenario: Get pets by status (Sold)
    Given path '/pet/findByStatus'
    And param status = petStatus[2]
    When method GET
    Then status 200
    And print response.map(pet => "{" + pet.id + ", " + pet.name + "}")

  Scenario: Get available pets counted by the same name
    Given path '/pet/findByStatus'
    And param status = petStatus[0]
    When method GET
    Then status 200
    And string payload = response
    And print petUtils.countPetsByName(payload)