Feature: Automate Test Set on GIBIRU by EB
  #All scenarios with the same name will be executed!!!
  Scenario: Search Engine for gibiru.com
    Given I open url "https://www.gibiru.com/"
    Then I should see page title as "Gibiru – Protecting your privacy since 2009"
    Then element with xpath "//input[@id='q']" should be present
    Then I type "dogs" into element with xpath "//input[@id='q']"
    Then I click on element with xpath "//button[@id='button-addon2']"
    Then I click on element with xpath "//div[contains(text(),'Images')]"
    And I wait for 5 sec
    Then element with xpath "//input[@id='q']" should be present
    Then element with xpath "//input[@id='q']" should have attribute "value" as "dogs"













