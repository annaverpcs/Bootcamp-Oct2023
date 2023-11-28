#Maria Simovski
  #Jir ID OC-1007


Feature: Medicenter Test Scenarios Admin and Patient Login Feature

    Scenario: Admin login with the valid credentials are accepted
      Given I open url "https://medicenter-qa2.vercel.app/"
      Then I should see page title as "Medicenter"
          #Login as admin
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then element with xpath "//a[contains(text(),'Back to home')]" should be present
      When I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type ='submit']"
      Then I wait for element with xpath "//h1[@class='font-medium text-xl']" to be present
      And I wait for element with xpath "//*[contains(text(),'Mary Poppins')]" to be present

  Scenario Outline: Login Date Driven Positive Scenarios.
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type <email> into element with xpath <email xpath1>
    Then I type <pass> into element with xpath <pass xpath>
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath <xpath3> to be present
    And I wait for element with xpath <xpath4> to be present
    Examples:
      | email xpath1           | email                      | pass       | pass xpath                | xpath3                                     | xpath4                                                 |
      | "//input[@id='email']" | "patient1@gmail.com"       | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'James Johnson')]"    | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "patient3@gmail.com"       | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Alice Wonderland')]" | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "administrator1@gmail.com" | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Mary Poppins')]"     | "//h1[text()='Medical Center']"                        |
      | "//input[@id='email']" | "administrator2@gmail.com" | "abc123"   | "//input[@id='password']" | "//*[contains(text(),'Calvin Grant')]"     | "//h1[text()='Medical Center']"                        |


  Scenario Outline: Login access denied Date Driven Negative Scenarios
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type <email> into element with xpath <email xpath1>
    Then I type <pass> into element with xpath <pass xpath>
    Then I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath <xpath3> to be present

    Examples:
      | email xpath1           | email                      | pass       | pass xpath                | xpath3
      | "//input[@id='email']" | "administrator1@gmail.com" | "abs321"   | "//input[@id='password']" | "//span[contains(text(),'Invalid login credentials')]"
      | "//input[@id='email']" | "Ndministrator1@gmail.com" | "abc123"   | "//input[@id='password']" | "//span[contains(text(),'Invalid login credentials')]"
      | "//input[@id='email']" | "administrator1@gmail.com" | ""         | "//input[@id='password']" | "//span[contains(text(),'Invalid login credentials')]"
      | "//input[@id='email']" | "patient1@gmail.com"       | "abs321"   | "//input[@id='password']" | "//span[contains(text(),'Invalid login credentials')]"




