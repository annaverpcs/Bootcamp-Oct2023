Feature: HW Search Engine Wiki
  Scenario: Search Engine for wiki.com
    Given I open url "https://www.wiki.com/"
    Then I should see page title as "Wiki.com"
    Then element with xpath "//input[@name='q']" should be present
    Then I type "Orange" into element with xpath "//input[@name='q']"
    Then I click on element with xpath "//input[@type='submit']" 
    And I wait for 3 sec
    Then I should see page title as "Form is not secure"
    Then element with xpath "//button[@id='proceed-button']" should be present
    Then I click on element with xpath "//button[@id='proceed-button']"
    Then I should see page title as "Wiki.com"
    Then element with xpath "//input[@name='q']" should be present
    Then I type "Orange" into element with xpath "//input[@name='q']"
    Then I click on element with xpath "//input[@type='submit']"
    And I wait for 3 sec


   
    