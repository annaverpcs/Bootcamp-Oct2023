#Author: Kateryna Rychenkov
  #Jira ID

Feature: Medicenter Selenium WevDriver Test Scenarios

  @medicenter4
  Scenario: Login as administrator with Selenium WebDriver methods
    #Given I open url "https://medicenter-qa2.vercel.app/"
    Given KR launch "MedicenterV2"
    Then KR page title is "Medicenter"
    And I wait for 2 sec
    Then KR click on "Login" button
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then KR type "coephillips@netscapezs.com" into "Email" textfield
    And KR type "zxc123" into "Password" textfield
    Then I wait for 1 sec
    And KR click on "Sign in" button
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And I wait for 2 sec
  
    #Then I wait for element with xpath "//h1[contains(text(),'Admin Test')]" to be present
    #And element with xpath "//h1[contains(text(),'Admin Test')]" should contain text "Admin Test"


