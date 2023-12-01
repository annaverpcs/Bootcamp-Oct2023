#Author: Kateryna Rychenkov
  #Jira ID
@medicenter
Feature: Sel WebDriver
  Scenario: Login as administrator with Selenium WebDriver methods
    #Given I open url "https://medicenter-qa2.vercel.app/"
  Given KR launch "MedicenterV2"
  Then KR page title is "Medicenter"
  And I wait for 2 sec


Feature: Medicenter Test Scenarios with background
# Background:comment out the same what is in Test cases (everytime this part will be executed)
  Background:
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present


  @medicenter1
  Scenario: Login as administrator
    #Given I open url "https://medicenter-qa2.vercel.app/"
    #Then I should see page title as "Medicenter"
            #Login as administrator
    #Then I click on element with xpath "//button[contains(text(),'Login')]"
    #Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type "coephillips@netscapezs.com" into element with xpath "//input[@id='email']"
    And I type "zxc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath "//h1[contains(text(),'Admin Test')]" to be present
    And element with xpath "//h1[contains(text(),'Admin Test')]" should contain text "Admin Test"

  @medicenter2
  Scenario Outline: Login to app with data driven scenario
    #Given I open url "https://medicenter-qa2.vercel.app/"
    #Then I should see page title as "Medicenter"
    #Then I click on element with xpath "//button[contains(text(),'Login')]"
    #Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    #use data driven values for login page
    Then I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath <XpathLoggedUsername> to be present
    #verification of logged user
    And element with xpath <XpathLoggedUsername> should contain text <FullName>
    And I wait for element with xpath "//button[contains(text(),'Specialists')]" to be present

    Examples:
      | EmailAddress                 | Password | XpathLoggedUsername                     | FullName       |
      | "coephillips@netscapezs.com" | "zxc123" | "//h1[contains(text(),'Admin Test')]"   | "Admin Test"   |
      | "administrator1@gmail.com"   | "abc123" | "//h1[contains(text(),'Mary Poppins')]" | "Mary Poppins" |

  @medicenter3
  Scenario: Create and delete an appointment as administrator
    #Given I open url "https://medicenter-qa2.vercel.app/"
    #Then I should see page title as "Medicenter"
            #Login as administrator
    #Then I click on element with xpath "//button[contains(text(),'Login')]"
    #Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type "coephillips@netscapezs.com" into element with xpath "//input[@id='email']"
    And I type "zxc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And I wait for element with xpath "//h1[contains(text(),'Admin Test')]" to be present
    Then element with xpath "//h1[contains(text(),'Admin Test')]" should contain text "Admin Test"
    And I wait for 2 sec
    #land on Home page as an administrator
    #add appointment
    Then I click on element with xpath "//button[contains(text(),'Appointments')]"
    And I wait for 2 sec
    Then I click on element with xpath "//button[contains(text(),'Add appointment')]"
    And I wait for element with xpath "//span[contains(text(),'New appointment')]" to be present
    Then I type "Patient First Name Last Name" into element with xpath "//input[@name='user_name']"
    Then I wait for 2 sec
    Then I type "Kate unique appointment" into element with xpath "//textarea[@id='note']"
    Then I wait for 2 sec
    Then I click on element with xpath "//select[@name='employee_id']"
    And I wait for 2 sec
    Then I click on element with xpath "//select[@name='employee_id']/..//option[3]"
    And I wait for 5 sec
    Then I type "12/12/2023" into element with xpath "//input[@id='date']"
    Then I click on element with xpath "//button[contains(text(),'10:45 AM')]"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    #verifacation adding
    Then I click on element with xpath "//span[@class='fc-icon fc-icon-chevron-right']"
    Then I wait for element with xpath "//h2[contains(text(),'December 2023')]" to be present
    And I wait for element with xpath "//div[contains(text(),'Patient First Name Last Name')]" to be present
    #delete appointment
    Then I click on element with xpath "//div[contains(text(),'Patient First Name Last Name')]"
    Then I wait for element with xpath "//dd[contains(text(),'Patient First Name Last Name')]" to be present
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 2 sec
    #verifacation deleting
    Then element with xpath "//div[contains(text(),'Patient First Name Last Name')]" should not be present


