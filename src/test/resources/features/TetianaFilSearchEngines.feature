Feature: Automation is begining
  Scenario: Search Engine for gibiru.com
    Given I open url "https://gibiru.com/"
    Then I should see page title as "Gibiru – Protecting your privacy since 2009"
    Then element with xpath "//input[@id='q']" should be present
    Then I type "Car" into element with xpath "//input[@id='q']"
    Then I click on element with xpath "//button[@type='submit' and @id='button-addon2']"
    And I wait for 3 sec
    Then


Scenario:  Search Engine for wiki.com
  Given I open url "https://wiki.com/"
  Then 