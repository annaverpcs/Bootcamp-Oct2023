#Author : Tetiana Fil
  #Jira ID OC-926
@medicenter
Feature: Medicenter Test Scenarios
  @medicenter1
  Scenario: Login as patient
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
     #login to app as patient
    Then I click on element with xpath "//button[contains(text(),'Login')] "
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
    And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And element with xpath "//h1[contains(text(),'James Johnson')]" should contain text "James Johnson"

  @medicenter2
  Scenario Outline: Login to the app data driven scenarios
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')] "
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    # used data driven value for login
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    Then I wait for element with xpath <xpathLoggedUsername> to be present
    # varification
    And element with xpath <xpathLoggedUsername> should contain text <FullName>
    Examples:
      | EmailAddress               | Password        |xpathLoggedUsername                               | FullName        |
      | "patient1@gmail.com"       | "abc123"        | "//h1[contains(text(),'James Johnson')]"         | "James Johnson" |
      | "administrator2@gmail.com" | "abc123"        | "//h1[contains(text(),'Calvin Grant')]"          | "Calvin Grant"  |
      | "patient1@gmail.com"       | "123456"        | "//h1[contains(text(),'James Johnson')]"         | "James Johnson" |
      | "patient3@gmail.com"       | "abc123"        | "//h1[contains(text(),'James Johnson')]"         | "James Johnson" |
      | "patient1@gmail.com"       |                 | "//h1[contains(text(),'James Johnson')]"         | "James Johnson" |
      | "patient1@gmail.com"       | "abc123"        | "//h1[contains(text(),'James Johnson')]"         | "Invalid Name " |

  @medicenter3
  Scenario: Create an appointment as patient and Delete one
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
     #login to app as patient
    Then I click on element with xpath "//button[contains(text(),'Login')] "
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[contains(text(),'Sign in')]"
    Then I wait for element with xpath "//h1[contains(text(),'James Johnson')]" to be present
    And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
   # make an appointment
    Then I click on element with xpath "//button[contains(text(),'Make an appointment')]"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "too strong back pain!!!!!!!!!!" into element with xpath "//textarea[@id='note']"
    Then I click on element with xpath "//select[@name='employee_id']"
    Then I wait for 2 sec
    Then I click on element with xpath "//select[@name='employee_id']/option[@value='4bbb674b-7fbd-4246-983a-9e93d659a3c1']"
    Then I wait for 5 sec
    Then I type "11/30/2023" into element with xpath "//input[@id='date']"
    Then I click on element with xpath "//button[contains(text(),'02:00 AM')]"
    Then I click on element with xpath "//button[contains(text(),'Save')]"
    #verification
    And I wait for element with xpath "//p[contains(text(),'too strong back pain!!!!!!!!!!')]" to be present
    #verification appointment is created
    Then I wait for element with xpath "//p[contains(text(),'too strong back pain!!!!!!!!!!')]/ancestor::article/div[2]/span" to be present
    Then I click on element with xpath "//p[contains(text(),'too strong back pain!!!!!!!!!!')]/ancestor::article/div[2]/span"
    And I wait for 2 sec
    #confirmation popup window
    Then element with xpath "//h2[contains(text(),'Are you sure you want to cancel appointment?')]" should contain text "Are you sure you want to cancel appointment?"
    And I wait for 2 sec
    Then I click on element with xpath " //button[contains(text(),'Cancel appointment')]"
    And I wait for 2 sec
    #verify that the appointment is deleted
    Then element with xpath "//p[contains(text(),'too strong back pain!!!!!!!!!!')]" should not be present
    And I wait for 10 sec

    @medicenter4
    Scenario: Create new specialist as administrator and Delete one
      Given I open url "https://medicenter-qa2.vercel.app/"
      Then I should see page title as "Medicenter"
     #login to app as administrator
      Then I click on element with xpath "//button[contains(text(),'Login')] "
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And I type "administrator2@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      Then I click on element with xpath "//button[contains(text(),'Sign in')]"
      Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
      And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
     #add specialist
  Then I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
      And I click on element with xpath "//button[contains(text(),'Add specialist')]"
      And I wait for 2 sec
      Then I wait for element with xpath "//div[@role='dialog']" to be present
      Then I type "Tommy" into element with xpath "//input[@id='first_name']"
      Then I type "Rommy" into element with xpath " //input[@id='last_name']"
      Then I click on element with xpath "//select[@name='role']"
      Then I wait for element with xpath "//option[contains(text(),'Doctor')]" to be present
      Then I type "09:00" into element with xpath "//input[@id='working_hours.tuesday.from']"
      And I type "16:00" into element with xpath "//input[@id='working_hours.tuesday.to']"
      Then I click on element with xpath "//button[contains(text(),'Save')]"
      And I wait for 10 sec
      Then I open url "https://medicenter-qa2.vercel.app/admin"
      Then I wait for element with xpath "//td[contains(text(),'Tommy Rommy')]" to be present
      # verify that the speciaist is created
      Then element with xpath "//td[contains(text(),'Tommy Rommy')]" should be present
      Then I click on element with xpath "//tbody/tr[77]/td[3]/div/span[2]/span[contains(text(),'delete')]"
      And I wait for element with xpath "//div[@role='dialog']" to be present
      Then I click on element with xpath "//button[contains(text(),'Remove specialist')]"
      And I wait for 2 sec
      #verify that specialist is deleted
      Then I open url "https://medicenter-qa2.vercel.app/admin"
     Then element with xpath "//td[contains(text(),'Tommy Rommy')]" should not be present


  @medicenter5
  Scenario: Update role and working hours for specialist
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
            #login to app as admin
Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type "administrator2@gmail.com" into element with xpath " //input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath " //button[contains(text(),'Sign in')]"
    # verification login
  Then I wait for 2 sec
    Then element with xpath "//h1[contains(text(),'Calvin Grant')]" should have text as "Calvin Grant"
    # edit specialist role
  Then I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
    Then I wait for element with xpath "//tbody/tr[4]" to be present
    Then element with xpath "//tbody/tr[4]//span[text()='Ophthalmologist']" should be present
    Then I click on element with xpath "//tbody/tr[4]//span[text()='edit']"
    Then I wait for 2 sec
    Then I wait for element with xpath "//div[@role='dialog']" to be present
Then element with xpath "//span[text()='Edit specialist info']" should be present
    Then I click on element with xpath "//select[@name='role']"
    Then I click on element with xpath "//option[@value='doctor']"
    Then I click on element with xpath "//button[contains(text(),'Save')]"
    #verification chandes
  Then I wait for 5 sec
    Then I wait for element with xpath "//button[contains(text(),'Add specialist')]" to be present
    Then I wait for 10 sec
    Then element with xpath "/tbody/tr[4]//span[contains(text(),'Doctor')]" should have text as "Doctor"

    @medicenter6
    Scenario: Create appointment as admin and delete
      Given I open url "https://medicenter-qa2.vercel.app/"
      Then I should see page title as "Medicenter"
     #login to app as administrator
      Then I click on element with xpath "//button[contains(text(),'Login')] "
      Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      And I type "administrator2@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      Then I click on element with xpath "//button[contains(text(),'Sign in')]"
      Then I wait for element with xpath "//h1[contains(text(),'Calvin Grant')]" to be present
      And I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
      #Create appointmet
  Then I wait for element with xpath "//button[text()='Appointments']" to be present
      Then I click on element with xpath "//button[text()='Appointments']"
      Then I wait for element with xpath "//button[text()='Add appointment']" to be present
      Then I click on element with xpath "//button[text()='Add appointment']"
      Then I wait for element with xpath "//span[text()='New appointment']" to be present
      Then I type "Alice Wonderland" into element with xpath "//input[@id='user_name']"
      Then I type "Tanya first visit" into element with xpath "//textarea[@id='note']"
      Then I mouse over element with xpath "//select[@name='employee_id']"
      Then I click on element with xpath "//select/option[@value='4bbb674b-7fbd-4246-983a-9e93d659a3c1']"
      Then I type "02/10/2024" into element with xpath "//input[@id='date']"
      Then I click on element with xpath " //button[contains(text(),'03:00 AM')]"
      Then I click on element with xpath "//button[contains(text(),'Save')]"
      #verification creating appointment
  Then I wait for 2 sec
      Then I wait for element with xpath "//button[text()='Add appointment']" to be present
      Then I wait for element with xpath "//a/div[text()='Alice Wonderland']" to be present
      Then I click on element with xpath "//a/div[text()='Alice Wonderland']"
      Then I wait for 2 sec
      Then I wait for element with xpath "//span[text()='Appointment summary']" to be present
      Then I click on element with xpath "//button[text()='Cancel appointment']"
      # verification deleting
  Then I wait for 2 sec
      Then I wait for element with xpath "//a/div[text()='Alice Wonderland']" to not be present






  



