#Author : Anna Verkhovskaya
  #Jira ID
@medicenter
Feature: Medicenter Test Scenarios

  @medicenter1
  Scenario: Login as patient
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
            #login to app as patient
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
    And element with xpath "//h1[contains(text(),'James Johnson')]" should contain text "James Johnson"

  @medicenter2
  Scenario Outline: Login to app data driven scenario
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    #use data driven values for login page
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath <xpathLoggedUsername> to be present
   #verification of logged user
    And element with xpath <xpathLoggedUsername> should contain text <FullName>
    Examples:
      | EmailAddress               | Password | xpathLoggedUsername                      | FullName        |
      | "patient1@gmail.com"       | "abc123" | "//h1[contains(text(),'James Johnson')]" | "James Johnson" |
      | "administrator1@gmail.com" | "abc123" | "//h1[contains(text(),'Mary Poppins')]"  | "Mary Poppins"  |
      | "patient1@gmail.com"       | "wrong"  | "//h1[contains(text(),'James Johnson')]" | "James Johnson" |
      | "invaliduser@gmail.com"    | "abc123" | "//h1[contains(text(),'James Johnson')]" | "James Johnson" |
      | "patient1@gmail.com"       | "abc123" | "//h1[contains(text(),'James Johnson')]" | "Invalid text"  |

  @medicenter3
  Scenario: Make an appointment and Delete an appointment
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
            #login to app as patient
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    #Land on Home page as a patient
    #make an appointment
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    When I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "Unique appointment from AnnaV 1" into element with xpath "//textarea[@id='note']"
    Then I click on element with xpath "//select[@name='employee_id']"
    And I wait for 2 sec
    Then I click on element with xpath "//select[@name='employee_id']/..//option[6]"
    Then I type "11/23/2023" into element with xpath "//input[@id='date']"
    And I wait for 2 sec
    Then I click on element with xpath "//button[contains(text(),'04:45 AM')]"
    Then I click on element with xpath "//button[contains(text(),'Save')]"
   #verify that appointment is created
    And I wait for element with xpath "//p[contains(text(),'Unique appointment from AnnaV 1')]" to be present
    #delete the appointment
    Then I wait for element with xpath "//p[contains(text(),'Unique appointment from AnnaV 1')]/ancestor::article/div[2]/span" to be present
    Then I click on element with xpath "//p[contains(text(),'Unique appointment from AnnaV 1')]/ancestor::article/div[2]/span"
    #confirmation window popup
    And element with xpath "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" should contain text "Are you sure you want to cancel appointment?"
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    #verify that the appointment is deleted
    Then element with xpath "//p[contains(text(),'Unique appointment from AnnaV 1')]" should not be present

  Scenario: Login as patient with Selenium WebDriver methods
    #Given I open url "https://medicenter-qa2.vercel.app/"
    Given AnnaV launch "MedicenterV2"
   #  Then I should see page title as "Medicenter"
     Then AnnaV page title is "Medicenter"

    And I wait for 1 sec

            #login to app as patient
   # Then I click on element with xpath "//button[contains(text(),'Login')]"
   # And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
   # And I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
   # And I type "abc123" into element with xpath "//input[@id='password']"
   # Then I click on element with xpath "//button[contains(text(),'Sign in')]"
   # Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    #Then I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
   # And element with xpath "//h1[contains(text(),'James Johnson')]" should contain text "James Johnson"





    