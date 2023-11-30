f# Author Ruslana Deineka
  # Jira ID OC-135
  # Medicenter

Feature: Log in as a patient

  Scenario: The "Login" button is presented and clickable (OC-152)
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    And element with xpath "//button[contains(text(),'Login')]" should be present

  Scenario: The "Create account" button is presented (OC-155)
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    And element with xpath "//button[contains(text(),'Create account')]" should be present

  Scenario: Log in as the patient with valid credentials
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "abaker81@healthcare-con.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And element with xpath "//h1[@class='font-medium text-xl']" should have text as "Ker Aba"


  Scenario Outline: Log in as the patient to app data driven scenario (Passed)
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    And element with xpath <Verify_EPath> should have text as <Verify_text>
    Examples:
      | EmailAddress                  | Password   | Verify_EPath                         |Verify_text    |
      | "abaker81@healthcare-con.com" | "abc123"   | "//h1[@class='font-medium text-xl']" |"Ker Aba"      |
      | "administrator1@gmail.com"    | "abc123"   | "//h1[@class='font-medium text-xl']" |"Mary Poppins" |

  Scenario Outline: Log in as the patient to app data driven scenario (Failed )
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type <EmailAddress> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type ='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present
    Then I wait for 2 sec
    And element with xpath "//h1[contains(text(),'Medical Center')]" should not be present
        Examples:
      | EmailAddress                     | Password   |
      | "abaker81@healthcare-con.com"    | "wrong"    |
      | "Invaliduser@healthcare-con.com" | "abc123"   |

Scenario: Log in as the patient with an empty email address field and valid password
  Given I open url "https://medicenter-qa2.vercel.app"
  Then I should see page title contains "Medicenter"
  Then I click on element with xpath "//button[contains(text(),'Login')]"
  And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
  And I type "abc123" into element with xpath "//input[@id='password']"
  #Then element with xpath "//button[@type ='submit']" should be disabled
  Then I click on element with xpath "//button[@type ='submit']"
  And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  Scenario: Log in as the patient with a valid email address and an empty password field
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    And I type "abaker81@healthcare-con.com" into element with xpath "//input[@id='email']"
  #Then element with xpath "//button[@type ='submit']" should be disabled
    Then I click on element with xpath "//button[@type ='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  Scenario: Log in as the patient with an empty email address field and an empty password field
    Given I open url "https://medicenter-qa2.vercel.app"
    Then I should see page title contains "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
      #Then element with xpath "//button[@type ='submit']" should be disabled
    Then I click on element with xpath "//button[@type ='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present








