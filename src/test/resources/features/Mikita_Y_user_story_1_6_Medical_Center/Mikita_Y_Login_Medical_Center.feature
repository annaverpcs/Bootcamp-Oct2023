# Author : Mikita Yakavenka
  # Jira ID oc-915 (related to oc-112)

Feature: Login Medical Center

  @medicenterM
  Scenario Outline: Login Date Driven Scenarios
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type <text1> into element with xpath <xpath2>
    Then I type <text2> into element with xpath <xpath3>
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath <xpath5> to be present
    And I wait for element with xpath <xpath6> to be present
    Examples:
      | xpath2                 | text1                      | text2      | xpath3                    | xpath5                                  | xpath6                                                 |
      | "//input[@id='email']" | "patient1@gmail.com"       | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'James Johnson')]" | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "patient2@gmail.com"       | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Ben Simpson')]"   | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "administrator1@gmail.com" | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Mary Poppins')]"  | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "administrator2@gmail.com" | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Calvin Grant')]"  | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "lol@gmail.com"            | "abc123"   | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | "patient1@gmail.com"       | "abc124"   | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | "patient99@gmail.com"      | "abc123"   | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | "   patient1@gmail.com"    | "abc123"   | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | "patient1@gmail.com"       | "  abc123" | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | ""                         | "abc123"   | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | "patient1@gmail.com"       | ""         | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |
      | "//input[@id='email']" | ""                         | ""         | "//input[@id='password']" | "//a[contains(text(),'Back to home')]"  | "//span[contains(text(),'Invalid login credentials')]" |

  @medicenterM
  Scenario Outline: Forgot your password option date driven scenarios
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I click on element with xpath "//*[contains(text(),'Forgot your password')]"
    And I wait for element with xpath "//button[@type='submit']" to be present
    And I type <text1> into element with xpath <xpath5>
    And I click on element with xpath "//button[@type='submit']"
    And I wait for 2 sec
    And I wait for element with xpath <xpath6> to be present
    Examples:
      | text1                        | xpath5                 | xpath6                                                                                      |
      | "patient1@gmail.com"         | "//input[@id='email']" | "//span[contains(text(),'Check your email for the password reset link')]"                   |
      | "patient1@gmail.com"         | "//input[@id='email']" | "//span[starts-with(text(),'For security purposes, you can only request this once every')]" |
      | "patient3@gmail.com"         | "//input[@id='email']" | "//span[contains(text(),'Check your email for the password reset link')]"                   |
      | "administrator1@gmail.com"   | "//input[@id='email']" | "//span[contains(text(),'Check your email for the password reset link')]"                   |
      | "patient99@gmail.com"        | "//input[@id='email']" | "//*[contains(text(),'Not registered email')]"                                              |
      | "  administrator2@gmail.com" | "//input[@id='email']" | "//*[contains(text(),'Invalid login')]"                                                     |
      | ""                           | "//input[@id='email']" | "//span[contains(text(),'Password recovery requires an email')]"                            |
      | "lol@gmail.com"              | "//input[@id='email']" | "//span[contains(text(),'Not registered email')]"                                           |

  @medicenterM
  Scenario Outline: Login/password field date driven scenarios
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Create account')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type <text1> into element with xpath <xpath2>
    Then I type <text2> into element with xpath <xpath3>
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath <xpath5> to be present
    Examples:
      | xpath2                 | text1                | text2                               | xpath3                    | xpath5                                                                  |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123"                            | "//input[@id='password']" | "//span[contains(text(),'Check your email for the confirmation link')]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"  | "//input[@id='password']" | "//span[contains(text(),'Check your email for the confirmation link')]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" | "//input[@id='password']" | "//*[starts-with(text(),'Password field doesn't accept')]"              |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc12"                             | "//input[@id='password']" | "//*[contains(text(),'Password should be at least 6 characters')]"      |
      | "//input[@id='email']" | "patient1@gmail.com" | "!@#$%^&*"                          | "//input[@id='password']" | "//span[contains(text(),'Check your email for the confirmation link')]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "      "                            | "//input[@id='password']" | "//*[starts-with(text(),'Password field doesn't accept')]"              |
      | "//input[@id='email']" | "patient1@gmail.com" | ""                                  | "//input[@id='password']" | "//*[contains(text(),'Signup requires a valid password')]"              |
      | "//input[@id='email']" | ""                   | "abc123"                            | "//input[@id='password']" | "//*[contains(text(),'To signup, please provide your email')]"          |
      | "//input[@id='email']" | "patient"            | "abc123"                            | "//input[@id='password']" | "//*[contains(text(),'To signup, please provide your email')]"          |
      | "//input[@id='email']" | ""                   | ""                                  | "//input[@id='password']" | "//*[contains(text(),'Signup requires a valid password')]"              |

  @medicenterM
  Scenario: Login with valid credentials
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h1[text()='Medical Center']" to be present
    And I wait for element with xpath "//*[contains(text(),'James Johnson')]" to be present


  @medicenterM
    # Scenario is created using Mikita's predefined steps
  Scenario: E2E (Login, Create, Delete, Logout)
  Given Mikita launch "https://medicenter-qa2.vercel.app/"
    Then Mikita wait 1 sec
    Then Mikita should see page title "Medical center"
    #Login
    Then Mikita click "//button[contains(text(),'Login')]"
    Then Mikita wait 1 sec
    Then Mikita assert element with xpath "//a[contains(text(),'Back to home')]" precent
    Then Mikita type "patient1@gmail.com" in field with xpath "//input[@id='email']"
    Then Mikita type "abc123" in field with xpath "//input[@id='password']"
    Then Mikita click "//button[@type='submit']"
    Then Mikita wait 1 sec
    Then Mikita assert element with xpath "//*[contains(text(),'My appointments')]" precent
    # Create appointment
    And Mikita click "//button[@type='button']"
    And Mikita wait 1 sec
    And Mikita type "teethache" in field with xpath "//textarea[@name='note']"
    Then Mikita try diff doctors "specialist1"
    Then Mikita wait 3 sec
    And Mikita click "//option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    And Mikita type "13/05/2024" in field with xpath "//input[@type='date']"
    And Mikita wait 1 sec
    And Mikita click "//button[@value='2024-05-13T09:00:00.000Z']"
    And Mikita click "//button[@type='submit']"
    And Mikita wait 1 sec
    Then Mikita assert element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'teethache')]]" precent
    Then Mikita click "//article[div[h3[contains(text(),'13 May 2024, 11:00')]]//p[contains(text(),'teethache')]]//div[@type='button']"
    # Cancel appointmnet
    Then Mikita click "//button[contains(text(),'Cancel appointment')]"
    # Logout
    Then Mikita click "//button[contains(text(),'Logout')]"
    Then Mikita wait 1 sec
    And Mikita assert element with xpath "//h2[text()='Login or create a new account to make an appointment']" precent
    
   

  @medicenterM
  Scenario: Login with valid email address and invalid password
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc124" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  @medicenterM
  Scenario: Login with invalid email address and valid password
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type " patient9@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  @medicenterM
  Scenario: Login with existing valid email of another account and valid password
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "bettetrizora-8631@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  @medicenterM
  Scenario: Login with valid email address and empty "Your Password" field
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "bettetrizora-8631@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  @medicenterM
  Scenario: Logout functionality
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h2[contains(text(),'Your appointments')]" to be present
    And I click on element with xpath "//button[contains(text(),'Logout')]"
    And I wait for element with xpath "//h2[text()='Login or create a new account to make an appointment']" to be present

  @medicenterM
  Scenario: "Email address" field accepts whitespaces
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "     patient1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And element with xpath "//h2[contains(text(),'Your appointments')]" should not be present

  @medicenterM
  Scenario: Password field accepts whitespaces
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "triroukugrequei-5954@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "      " into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

  @medicenterM
  Scenario:  "Password" field accepts all characters
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "groilaffofrutrou-2860@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "Mik123!£$%&/" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h2[contains(text(),'Your appointments')]" to be present

  @medicenterM
  Scenario: Create account with password longer than 32 characters
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Create account')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "quoigaciffoigrau-3282@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//*[contains(text(),'Check your email')]" to not be present

  @medicenterM
  Scenario: Create account with password of 6 characters
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Create account')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "sejuddizeitra-8071@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "123456" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//*[contains(text(),'Check your email')]" to be present

  @medicenterM
  Scenario: Create account with password shorter than 6 characters
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Create account')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "sofitrinneco-3436@yopmail.com" into element with xpath "//input[@id='email']"
    Then I type "12345" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//span[contains(text(),'Password should be at least 6 characters')]" to be present

  @medicenterM
  Scenario: "Back to home" button works
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present
    Then I click on element with xpath "//a[contains(text(),'Back to home')]"
    And I wait for element with xpath "//h2[text()='Login or create a new account to make an appointment']" to be present





