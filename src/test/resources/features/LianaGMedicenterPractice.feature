#Author : Liana Gizatulina
  #Jira ID OC-928

Feature: Admin can cancel an appointment

  Scenario: Administrator can cancel an appointment
    Given I open url "https://medicenter-qa2.vercel.app/"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for 2 sec
    When I click on element with xpath "//button[contains(text(),'Appointments')]"
    When I click on element with xpath "//div[contains(text(),'LIANA XPATH')]"
    Then I wait for 2 sec
    When I click on element with xpath "//button[contains(text(),'Cancel appointment')]"



