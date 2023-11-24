git remote#A: Maria Simovski
  #Jir ID OC1007

Feature: Medicenter Test Scenarios

  Admin should be login with right credentials, wrong credentials should not be accepted.


    Scenario: Admin right credentials are accepted
      Given I open url "https://medicenter-qa2.vercel.app/"
      Then I should see page title as "Medicenter"
          #Login as admin
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then element with xpath "//a[contains(text(),'Back to home')]" should be present
      When I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
      And I type "abc123" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//button[@type ='submit']"
      Then I wait for element with xpath "//h1[@class='font-medium text-xl']" to be present
      And element with xpath "//h1[contains(text(),'Mary Poppins')]" should contain text "Mary Poppins"