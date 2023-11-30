# Author : Roman Tovt
  # Jira ID oc-176
Feature: Medicenter Test Scenarios

  @medicenter1
  Scenario: Add Specialist with Valid Data
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
            #login to app as administrator
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath "//h1[contains(text(),'Mary Poppins')]" to be present
    And element with xpath "//h1[contains(text(),'Mary Poppins')]" should contain text "Mary Poppins"
    And I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
               #Add Specialist
    Then I click on element with xpath "//button[contains(text(),'Add specialist')]"
    And I wait for element with xpath "//span[text()='person_add']" to be present
    And I type "Roman" into element with xpath "//input[@id='first_name']"
    And I type "Doc" into element with xpath "//input[@id='last_name']"
    Then I click on element with xpath "//select[@name='role']"
    Then I click on element with xpath "//option[@value='doctor']"
    Then I click on element with xpath "//button[@id='monday']"
    And I type "0900" into element with xpath "//input[@id='working_hours.monday.from']"
    And I type "1800" into element with xpath "//input[@id='working_hours.monday.to']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
                 #Check if specialist was created
    Then I wait for element with xpath "//td[contains(text(),'Roman Doc')]" to be present
