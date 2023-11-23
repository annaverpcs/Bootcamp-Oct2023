#Author : Inna Havryliuk
  # Jira ID OC-150 related to OC-153.

Feature: Add appointment as an administrator to Medicenter
    #Add appointment as an administrator
  Scenario:The administrator adds appointment
    Given I open url "https://medicenter-qa2.vercel.app"
    Then element with xpath "//h1[contains(text(),'Medical Center')]" should be present
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And element with xpath "//a[contains(text(),'Back to home')]" should be present
     # Enter with valid credentials for administrator
     # Login: administrator1@gmail.com    Password: abc123
    Then I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type ='submit']"
    And I wait for 5 sec
    And element with xpath "//h1[@class='font-medium text-xl']" should contain text "Mary Poppins"
    Then I click on element with xpath "//button[contains(text(),'Appointments')]"
    Then I click on element with xpath " //button[contains(text(),'Add appointment')]"
    Then element with xpath "//span[contains(text(),'New appointment')]" should be present
     # Create new appointment
    Then I type "Inna Dp" into element with xpath "//input[@id='user_name']"
    Then I type "Create From IntelliJ" into element with xpath "//textarea[@id='note']"
    Then I click on element with xpath "//option[@value='c83b98eb-072b-42b1-8471-e7d7c71fb5a7']"
    And I wait for 3 sec
    Then I type "12/02/2023" into element with xpath "//input[@id='date']"
    And I click on element with xpath "//button[contains(text(),'12:00 PM')]"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 3 sec
     # I am verify that appointment appear at the calendar
    Then element with xpath "//h2[@class='fc-toolbar-title']" should be present
     # Click Next month Toggles
    And I click on element with xpath "//button[@title='Next month']"
    And I wait for 3 sec
     #choose appointment by patient name
    Then I click on element with xpath "//div[contains(text(),'Inna Dp')]"
    And I wait for 3 sec
    Then element with xpath "//span[contains(text(),'Appointment summary')]" should be present
    Then element with xpath "//span[contains(text(),'Inna')]" should be present
     # Delete appointment
    And I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 3 sec
    Then element with xpath "//div[contains(text(),'Inna Dp')]" should not be present
