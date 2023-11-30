#Author : Anna Verkhovskaya
  #Jira ID
@medicenter
Feature: Medicenter Selenium WebDriver Test Scenarios

  @medicenter4
  Scenario: Login as patient with Selenium WebDriver methods
    Given AnnaV launch "MedicenterV2"
    Then AnnaV page title is "Medicenter"
    Then AnnaV click on "Login" button
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And AnnaV type "patient1@gmail.com" into "Email" textfield
    And AnnaV type "abc123" into "Password" textfield
    Then I wait for 1 sec
    Then AnnaV click on "Sign in" button
   Then I wait for 5 sec
   # Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    #Then I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
   # And element with xpath "//h1[contains(text(),'James Johnson')]" should contain text "James Johnson"
