# Author : Mikita Yakavenka
  # Jira ID oc-112

Feature: Login Medical Center
  Scenario: Login with valid credential login
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//input[@id='email']" should be present
    Then I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h2[contains(text(),'Your appointments')]" to be present

    Scenario: Login with valid email address and invalid password
      Given I open url "https://medicenter-qa2.vercel.app/"
      Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then element with xpath "//input[@id='email']" should be present
      Then I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
      Then I type "abc124" into element with xpath "//input[@id='password']"
      Then I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present


      Scenario: Login with invalid email address and valid password
        Given I open url "https://medicenter-qa2.vercel.app/"
        Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
        Then I click on element with xpath "//button[contains(text(),'Login')]"
        Then element with xpath "//input[@id='email']" should be present
        Then I type " patient9@gmail.com" into element with xpath "//input[@id='email']"
        Then I type "abc123" into element with xpath "//input[@id='password']"
        Then I click on element with xpath "//button[@type='submit']"
        And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

        Scenario: Login with existing valid email of another account and valid password
          Given I open url "https://medicenter-qa2.vercel.app/"
          Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
          Then I click on element with xpath "//button[contains(text(),'Login')]"
          Then element with xpath "//input[@id='email']" should be present
          Then I type "bettetrizora-8631@yopmail.com" into element with xpath "//input[@id='email']"
          Then I type "abc123" into element with xpath "//input[@id='password']"
          Then I click on element with xpath "//button[@type='submit']"
          And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

          Scenario: Login with valid email address and empty "Your Password" field
            Given I open url "https://medicenter-qa2.vercel.app/"
            Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
            Then I click on element with xpath "//button[contains(text(),'Login')]"
            Then element with xpath "//input[@id='email']" should be present
            Then I type "bettetrizora-8631@yopmail.com" into element with xpath "//input[@id='email']"
            Then I type "" into element with xpath "//input[@id='password']"
            Then I click on element with xpath "//button[@type='submit']"
            And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

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

              Scenario: "Email address" field accepts whitespaces
                Given I open url "https://medicenter-qa2.vercel.app/"
                Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                Then I click on element with xpath "//button[contains(text(),'Login')]"
                Then element with xpath "//input[@id='email']" should be present
                Then I type "     patient1@gmail.com" into element with xpath "//input[@id='email']"
                Then I type "abc123" into element with xpath "//input[@id='password']"
                Then I click on element with xpath "//button[@type='submit']"
                And element with xpath "//h2[contains(text(),'Your appointments')]" should not be present

                Scenario: Password field accepts whitespaces
                  Given I open url "https://medicenter-qa2.vercel.app/"
                  Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                  Then I click on element with xpath "//button[contains(text(),'Login')]"
                  Then element with xpath "//input[@id='email']" should be present
                  Then I type "triroukugrequei-5954@yopmail.com" into element with xpath "//input[@id='email']"
                  Then I type "      " into element with xpath "//input[@id='password']"
                  Then I click on element with xpath "//button[@type='submit']"
                  And I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present

                  Scenario:  "Password" field accepts all characters
                    Given I open url "https://medicenter-qa2.vercel.app/"
                    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                    Then I click on element with xpath "//button[contains(text(),'Login')]"
                    Then element with xpath "//input[@id='email']" should be present
                    Then I type "groilaffofrutrou-2860@yopmail.com" into element with xpath "//input[@id='email']"
                    Then I type "Mik123!£$%&/" into element with xpath "//input[@id='password']"
                    Then I click on element with xpath "//button[@type='submit']"
                    And I wait for element with xpath "//h2[contains(text(),'Your appointments')]" to be present

                    Scenario: Create account with password longer than 32 characters
                      Given I open url "https://medicenter-qa2.vercel.app/"
                      Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                      Then I click on element with xpath "//button[contains(text(),'Create account')]"
                      Then element with xpath "//input[@id='email']" should be present
                      Then I type "quoigaciffoigrau-3282@yopmail.com" into element with xpath "//input[@id='email']"
                      Then I type "QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ" into element with xpath "//input[@id='password']"
                      Then I click on element with xpath "//button[@type='submit']"
                      And I wait for element with xpath "//*[contains(text(),'Check your email')]" to not be present

                      Scenario: Create account with password of 6 characters
                        Given I open url "https://medicenter-qa2.vercel.app/"
                        Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                        Then I click on element with xpath "//button[contains(text(),'Create account')]"
                        Then element with xpath "//input[@id='email']" should be present
                        Then I type "sejuddizeitra-8071@yopmail.com" into element with xpath "//input[@id='email']"
                        Then I type "123456" into element with xpath "//input[@id='password']"
                        Then I click on element with xpath "//button[@type='submit']"
                        And I wait for element with xpath "//*[contains(text(),'Check your email')]" to be present

                        Scenario: Create account with password shorter than 6 characters
                          Given I open url "https://medicenter-qa2.vercel.app/"
                          Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                          Then I click on element with xpath "//button[contains(text(),'Create account')]"
                          Then element with xpath "//input[@id='email']" should be present
                          Then I type "sofitrinneco-3436@yopmail.com" into element with xpath "//input[@id='email']"
                          Then I type "12345" into element with xpath "//input[@id='password']"
                          Then I click on element with xpath "//button[@type='submit']"
                          And I wait for element with xpath "//span[contains(text(),'Password should be at least 6 characters')]" to be present

                          Scenario: "Back to home" button works
                            Given I open url "https://medicenter-qa2.vercel.app/"
                            Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
                            Then I click on element with xpath "//button[contains(text(),'Login')]"
                            Then element with xpath "//a[contains(text(),'Back to home')]" should be present
                            Then I click on element with xpath "//a[contains(text(),'Back to home')]"
                            And I wait for element with xpath "//h2[text()='Login or create a new account to make an appointment']" to be present