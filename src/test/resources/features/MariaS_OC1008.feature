#Maria Simovski
  #Jir ID OC-1008

Feature: Medicenter Test Scenarios Admin can add and cancel an appointment

  Scenario: : Admin can add and cancel an appointment
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
          #Login as admin
    When I click on element with xpath "//button[contains(text(),'Login')]"
    Then element with xpath "//a[contains(text(),'Back to home')]" should be present
    When I type "administrator1@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type ='submit']"
    And I wait for 3 sec
    Then I wait for element with xpath "//h1[@class='font-medium text-xl']" to be present
    And I wait for element with xpath "//*[contains(text(),'Mary Poppins')]" to be present
    When I click on element with xpath "//*[contains(text(),'Appointments')]"
    # Make an appointment
    And I click on element with xpath "//button[contains(text(),'Add appointment')]"
    Then element with xpath "//span[contains(text(),'New appointment')]" should be present
    When I type "Maria Test" into element with xpath "//input[@id='user_name']"
    And I type "Test Test" into element with xpath "//textarea[@id='note']"
    Then I click on element with xpath "//select[@name='employee_id']"
    # Select Masha S Cordiologist
    And I click on element with xpath "//select[@name='employee_id']/option[@value='feeac9f6-d5fd-49cd-afcf-df9be18874ac']"
    And I wait for 3 sec
    When I type "11/30/2023" into element with xpath "//input[@type='date']"
    And I wait for 2 sec
    When element with xpath "//button[contains(text(),'02:00 PM')]" should be present
    And I click on element with xpath "//button[contains(text(),'02:00 PM')]"
    And I click on element with xpath "//button[contains(text(),'Save')]"
    And I wait for 3 sec
    When I click on element with xpath "//button[contains(text(),'month')]"
    Then element with xpath "//td//*[@data-date='2023-11-29']//*[contains(text(),'2p')]/..//div[contains(text(),'Maria Test')]" should contain text "Maria Test"
    # Delete an appointment
    When I click on element with xpath "//td//*[@data-date='2023-11-29']//*[contains(text(),'2p')]/..//div[contains(text(),'Maria Test')]"
    And I wait for 1 sec
    And element with xpath "//span[contains(text(),'Appointment summary')]" should be present
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    Then element with xpath "//td//*[@data-date='2023-11-29']//*[contains(text(),'2p')]/..//div[contains(text(),'Maria Test')]" should not be present