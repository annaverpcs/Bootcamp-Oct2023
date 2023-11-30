#Author : Maryna Hadirova
  # Jira ID OC-147

@medicenter
Feature: MedicalCenter Edit a specialist data

  @medicenter1
  Scenario: Edit input in "First name" field
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
      #login to app as administrator
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      #Admin data (email-"administrator1@gmail.com"), (password-"abc123")
    Then I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And I wait for 3 sec
      #open popup 'Edit specialist info'
    When I click on element with xpath "//tr[td[contains(text(),'Maryna V2 Doctor')]]//span[contains(text(),'edit')]"
    And I wait for element with xpath "//span[contains(text(),'Edit specialist info')]" to be present
    And I wait for 3 sec
      #Edit First name input
    Then I clear element with xpath "//input[@id='first_name']"
    When I type "Maryna V3" into element with xpath "//input[@id='first_name']"
    And I click on element with xpath "//button[@type ='submit']"
    Then I wait for 5 sec
    Then I open url "https://medicenter-qa2.vercel.app/"
    Then I wait for 10 sec
    And element with xpath "//td[contains(text(),'Maryna V3 Doctor')]" should contain text "Maryna V3 Doctor"

