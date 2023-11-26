#Author: Elena Baklagina
  #Jira ID:OC-913 related to OC-912: Automate Test Set

      #------------------------------------------Login as Patient---------------------------------------------------

Feature: Medicenter Test Scenarios
      #Login as a Patient to the app, using "Data Driven Scenarios":
  Scenario Outline: UserStory#1 - As a Patient I can Login to MediCenter_DDS
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
       #Login to app as a Patient
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      #Use Data Driven Values for LoginPage:
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath <xpathLoggedUserName> to be present
      #Verification of logged user:
    And element with xpath <xpathLoggedUserName> should contain text <FullName>

    Examples:
      | EmailAddress         | Password | xpathLoggedUserName                         | FullName           |
        #Can login to MediCenter with valid credentials_TC1
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" |
        #Cannot login to MediCenter with empty email field_TC2
      | ""                   | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" |
        #Cannot login with invalid password_TC3
      | "patient3@gmail.com" | "abc122" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" |
        #Can login with password field lenght of 6 to 32 characters_TC4
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" |
        #Cannot login with password field lenght of 5 characters_TC5
      | "patient3@gmail.com" | "ab123"  | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" |

      #-----------------------------------Add an Appointment------------------------------------------------------

   #Add an Appointment as a Patient to the app, using "Data Driven Scenarios":
Feature: Medicenter Test Scenarios
  Scenario Outline: UserStory#6 - As a Patient I Add an Appointment to MediCenter_DDS
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
        #Login to app as a Patient
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath <xpathLoggedUserName> to be present
          #Verification of logged user:
    And element with xpath <xpathLoggedUserName> should contain text <FullName>
          #Land on Home Page as a Patient and Make a new Appointment:
    Then I click on element with xpath <MakeAppointment>
    When I wait for element with xpath <MakeAppointment> to be present
    Then I type <PurposeAppointment> into element with xpath " //textarea[@id='note']"
    Then I click on element with xpath "//select[@name='employee_id']"
    And I wait for 2 sec
    Then I click on element with xpath "//select[@name='employee_id']/..//option[1]"
    Then I type <Date> into element with xpath "//input[@id='date']"
    Then I click on element with xpath "//button[contains(text(),'Save')]"
        #Verification
    And I wait for element with xpath <xpathYourAppointment> to be present
    Examples:
      | EmailAddress         | Password | xpathLoggedUserName                         | FullName           | MakeAppointment                                    | PurposeAppointment | Date         | xpathYourAppointment
          #Can Add an Appointment with All Valid Credentials_TC1
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" | "//button[contains(text(),'Make an appointment')]" | "123"              | "11/30/2023" | "//p[contains(text(),'123')]"
        #Cannot Add an Appointment with Invalid Date field_TC2
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" | "//button[contains(text(),'Make an appointment')]" | "123"              | "11/30/2020" | "//p[contains(text(),'123')]"
        #Cannot Add an Appointment with empty "Purpose of appointment"_TC3
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" | "//button[contains(text(),'Make an appointment')]" | ""                 | "11/30/2023" | "//p[contains(text(),'123')]"
        # Cannot Add an Appointment without any date chosen_TC5
      | "patient3@gmail.com" | "abc123" | "//h1[contains(text(),'Alice Wonderland')]" | "Alice Wonderland" | "//button[contains(text(),'Make an appointment')]" | "123"              | ""           | "//p[contains(text(),'123')]"

