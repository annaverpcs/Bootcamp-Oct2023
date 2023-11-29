#Author : Inna Havryliuk
  # Jira ID OC-151

Feature: "Contact Us" page
    #Login as a patient
  Scenario: "Contact Us" page view for a patient
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[contains(text(),'Medical Center')]" should be present
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    And I wait for 2 sec
    And element with xpath "//a[contains(text(),'Back to home')]" should be present
     # Enter with valid credentials for patient
     # Login: dp37855@slfence.com    Password: abc123
    And I type "dp37855@slfence.com" into element with xpath "//input[@id='email']"
    Then I type "abc123" into element with xpath "//input[@id='password']"
    Then I click on element with xpath "//button[@type ='submit']"
    And I wait for 2 sec
    And element with xpath "//h1[@class='font-medium text-xl']" should contain text "Inna Dp"
      # Patient goes to the "Contact us" page
      # and check that all the necessary information is presented on the page
    Then I click on element with xpath "//a[@href='/contact']"
    And element with xpath "//h2[contains(text(),'Contact us')]" should be present
    And element with xpath "//h3[contains(text(),'Reception')]" should be present
    Then element with xpath "//a[@href='mailto:medicenter@example.com']" should be present
    Then element with xpath "//dt[contains(text(),'Email')]/ancestor::div/dl/div[2]/a" should be present
    And I wait for 3 sec
    Then element with xpath "//*[contains(text(),'First contact ')]" should be present
    Then element with xpath "//h3[contains(text(),'First contact')]/ancestor::div/dl/div/a" should be present
    Then element with xpath "//h3[contains(text(),'Diagnostic and Surgical Office')]" should be present
    And element with xpath "//h3[contains(text(),'Diagnostic and Surgical Office')]/ancestor::div/dl/div/a" should be present
    And element with xpath "//h3[contains(text(),'Opening hours')]" should be present
    Then element with xpath "//dt[contains(text(),'Monday')]" should be present
    Then element with xpath "//dt[contains(text(),'Tuesday')]" should be present
    Then element with xpath "//dt[contains(text(),'Wednesday')]" should be present
    And element with xpath "//dt[contains(text(),'Thursday')]" should be present
    And element with xpath "//dt[contains(text(),'Friday')]" should be present




  Scenario: "Contact Us" page view for a guest
      # Go to "Contact Us" page as a guest
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then element with xpath "//h1[contains(text(),'Medical Center')]" should be present
      # Guest goes to the "Contact us" page
      # and check that all the necessary information is presented on the page
    Then I click on element with xpath "//a[@href='/contact']"
    And element with xpath "//h2[contains(text(),'Contact us')]" should be present
    And element with xpath "//h3[contains(text(),'Reception')]" should be present
    Then element with xpath "//a[@href='mailto:medicenter@example.com']" should be present
    Then element with xpath "//dt[contains(text(),'Email')]/ancestor::div/dl/div[2]/a" should be present
    And I wait for 3 sec
    Then element with xpath "//*[contains(text(),'First contact ')]" should be present
    Then element with xpath "//h3[contains(text(),'First contact')]/ancestor::div/dl/div/a" should be present
    Then element with xpath "//h3[contains(text(),'Diagnostic and Surgical Office')]" should be present
    And element with xpath "//h3[contains(text(),'Diagnostic and Surgical Office')]/ancestor::div/dl/div/a" should be present
    And element with xpath "//h3[contains(text(),'Opening hours')]" should be present
    Then element with xpath "//dt[contains(text(),'Monday')]" should be present
    Then element with xpath "//dt[contains(text(),'Tuesday')]" should be present
    Then element with xpath "//dt[contains(text(),'Wednesday')]" should be present
    And element with xpath "//dt[contains(text(),'Thursday')]" should be present
    And element with xpath "//dt[contains(text(),'Friday')]" should be present



    
