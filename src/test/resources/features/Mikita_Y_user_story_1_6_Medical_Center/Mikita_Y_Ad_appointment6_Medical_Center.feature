# Author : Mikita Yakavenka
  # Jira ID oc-915(related to oc-140)


Feature: Add an appointment Medical Center

  @medicenterM
  Scenario Outline: Create appointment typing different characters into info field
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    When I type <text1> into element with xpath <xpath2>
    When I type <text2> into element with xpath <xpath3>
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//*[contains(text(),'James Johnson')]" to be present
    # Create an appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type <text3> into element with xpath <xpath7>
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for <sec> sec
    Then I click on element with xpath <xpath9>
    Then I type <text4> into element with xpath <xpath10>
    Then I wait for <sec> sec
    Then I click on element with xpath <xpath11>
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath <xpath12> to be present
    Examples:
      |  xpath2                 | text1                | text2    | xpath3                   | text3      | xpath7                      | sec | xpath9                                                           | text4        | xpath10                | xpath11                                       | xpath12                                                                                            |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "Headache" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T09:00:00.000Z']" | "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'Headache')]]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "1234567890" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T09:15:00.000Z']" | "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:15')]]//p[contains(text(),'1234567890')]]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "@#$%^&*(" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T09:30:00.000Z']" | "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:30')]]//p[contains(text(),'@#$%^&*(')]]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T09:45:00.000Z']" | "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:45')]]//p[contains(text(),'')]]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T10:15:00.000Z']" | "//article[div[h3[contains(text(),'Monday 13 May 2024, 12:15')]]//p[contains(text(),'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii')]]" |
      | "//input[@id='email']" | "patient1@gmail.com" | "abc123" | "//input[@id='password']"| "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii" | "//textarea[@name='note']"    | 2 | "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']" | "13/05/2024" | "//input[@type='date']" | "//button[@value='2024-05-13T10:30:00.000Z']" | "//p[contains(text(),'Note must be less than 500 characters long')]" |

  @medicenterM
  Scenario: Registered patient  can add an appointment
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create an appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "Headache" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:00')]" to be present

  @medicenterM
    Scenario: Create appointment with empty  "Info" field
      Given I open url "https://medicenter-qa2.vercel.app/"
      When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
      # Login as a patient
      When I click on element with xpath "//button[contains(text(),'Login')]"
      When I wait for element with xpath "//input[@id='email']" to be present
      When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
      When I type "abc123" into element with xpath "//input[@id='password']"
      When I click on element with xpath "//button[@type='submit']"
      When I wait for element with xpath "//button[@type='button']" to be present
      # Create an appointment
      When I click on element with xpath "//button[@type='button']"
      Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
      Then element with xpath "//label[contains(text(),'Specialist')]" should be present
      Then I wait for 2 sec
      Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
      Then I type "13/05/2024" into element with xpath "//input[@type='date']"
      Then I wait for 1 sec
      Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:00')]" to be present

  @medicenterM
  Scenario: Appointment is present after logout
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create an appoitnment
    When I click on element with xpath "//button[@type='button']"
    When I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    When I type "Headache" into element with xpath "//textarea[@name='note']"
    When element with xpath "//label[contains(text(),'Specialist')]" should be present
    When I wait for 2 sec
    When I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    When I type "13/05/2024" into element with xpath "//input[@type='date']"
    When I wait for 1 sec
    When I click on element with xpath "//button[@value='2024-05-13T09:15:00.000Z']"
    When I click on element with xpath "//button[@type='submit']"
    # Logout
    And I click on element with xpath "//button[contains(text(),'Logout')]"
    And I wait for 1 sec
    # Login as a patient
    And I click on element with xpath "//button[contains(text(),'Login')]"
    And element with xpath "//input[@id='email']" should be present
    And I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    And I type "abc123" into element with xpath "//input[@id='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:15')]" to be present

  @medicenterM
  Scenario: Cancel appointment
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:15')]" to be present
    # Delete an appointment
    Then I click on element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 11:15')]]/div[@type='button']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    And element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 11:15')]]" should not be present

  @medicenter
  Scenario: Create appointment with past date
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create an appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "Headache" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "21/11/2023" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2023-11-21T07:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div//h3[contains(text(),'Tuesday 21 November 2023, 08:00')]]" to be present

  @medicenterM
  Scenario: Create more than 1 appointment with the same specialist and at the same time
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create first appoitnment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:00')]" to be present
    # Create second appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "Headache" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'Headache')]]" to not be present

  @medicenterM
  Scenario: Create 2 appointments with different  specialists at the same time
    Given I open url "https://medicenter-qa2.vercel.app/"
    # Login as a patient
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create first appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "backache" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:00')]" to be present
    # Create second appoitnment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "legs hurt" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='314f574a-8b88-4927-818a-55e375e7d874']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'legs hurt')]]" to not be present

  @medicenterM
    Scenario: Create 2 appointments with different accounts with the same specialist at the same time
      Given I open url "https://medicenter-qa2.vercel.app/"
      # Login as a first patient
      When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
      When I click on element with xpath "//button[contains(text(),'Login')]"
      When I wait for element with xpath "//input[@id='email']" to be present
      When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
      When I type "abc123" into element with xpath "//input[@id='password']"
      When I click on element with xpath "//button[@type='submit']"
      When I wait for element with xpath "//button[@type='button']" to be present
      # Create an appointment
      When I click on element with xpath "//button[@type='button']"
      Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
      Then I type "stomachache" into element with xpath "//textarea[@name='note']"
      Then element with xpath "//label[contains(text(),'Specialist')]" should be present
      Then I wait for 2 sec
      Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
      Then I type "13/05/2024" into element with xpath "//input[@type='date']"
      Then I wait for 1 sec
      Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'stomachache')]]" to be present
      # Logout
      And I click on element with xpath "//button[contains(text(),'Logout')]"
      And I wait for 2 sec
      # Login as second patient
      Then I click on element with xpath "//button[contains(text(),'Login')]"
      Then I wait for element with xpath "//input[@id='email']" to be present
      Then I type "patient2@gmail.com" into element with xpath "//input[@id='email']"
      Then I type "abc123" into element with xpath "//input[@id='password']"
      Then I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//button[@type='button']" to be present
      # Create an appointment
      Then I click on element with xpath "//button[@type='button']"
      Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
      Then I type "heart attac" into element with xpath "//textarea[@name='note']"
      Then element with xpath "//label[contains(text(),'Specialist')]" should be present
      Then I wait for 2 sec
      Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
      Then I type "13/05/2024" into element with xpath "//input[@type='date']"
      Then I wait for 1 sec
      Then I click on element with xpath "//button[@value='2024-05-13T09:00:00.000Z']"
      And I click on element with xpath "//button[@type='submit']"
      And I wait for element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'heart attac')]]" to not be present

  @medicenterM
  Scenario: "Info" field accepts special characters
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "!£$%^&*()_+@in" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-13T11:15:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 13:15')]]//p[contains(text(),'!£$%^&*()_+@in')]]" to be present

  @medicenterM
  Scenario: "Info" field accepts numbers
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "1234567890" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "14/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-14T11:15:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div[h3[contains(text(),'Tuesday 14 May 2024, 13:15')]]//p[contains(text(),'1234567890')]]" to be present

  @medicenterM
  Scenario: Insert 500 characters in "info" field
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "14/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-14T11:30:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//article[div[h3[contains(text(),'Tuesday 14 May 2024, 13:30')]]//p[contains(text(),'llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll')]]" to be present


  @medicenterM
  Scenario: Insert 501 characters in "info" field
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "14/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2024-05-14T11:45:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//p[contains(text(),'Note must be less than 500 characters long')]" to be present

  @medicenterM
  Scenario: Create appointment without specifying date
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create an appointment (select today's date)
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "Toothache" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[@value='2023-11-23T09:00:00.000Z']"
    And I click on element with xpath "//button[@type='submit']"
    And I wait for element with xpath "//h3[contains(text(),'Thursday 23 November 2023, 10:00')]" to not be present

  @medicenterM
  Scenario: Create an appointment without specifying time
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient3@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    When I wait for element with xpath "//button[@type='button']" to be present
    # Create an appointment
    When I click on element with xpath "//button[@type='button']"
    Then I wait for element with xpath "//span[contains(text(),'Make an appointment')]" to be present
    Then I type "sore throat" into element with xpath "//textarea[@name='note']"
    Then element with xpath "//label[contains(text(),'Specialist')]" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//select/option[@value='24b6d9ff-0742-450f-8d89-b083caad0336']"
    Then I type "13/05/2024" into element with xpath "//input[@type='date']"
    Then I wait for 1 sec
    And I click on element with xpath "//button[@type='submit']"
    And element with xpath "//article[div[h3[contains(text(),'Monday 13 May 2024, 11:00')]]//p[contains(text(),'sore throat')]]" should not be present

  @medicenterM
  Scenario: Cancel appointment(1)
    Given I open url "https://medicenter-qa2.vercel.app/"
    When element with xpath "//h1[text()='Medical Center']" should contain text "Medical Center"
    # Login as a patient
    When I click on element with xpath "//button[contains(text(),'Login')]"
    When I wait for element with xpath "//input[@id='email']" to be present
    When I type "patient1@gmail.com" into element with xpath "//input[@id='email']"
    When I type "abc123" into element with xpath "//input[@id='password']"
    When I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//h3[contains(text(),'Monday 13 May 2024, 11:00')]" to be present
    # Delete an appointment
    Then I click on element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 11:00')]]/div[@type='button']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    Then I click on element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 11:00')]]/div[@type='button']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    Then I click on element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 13:15')]]/div[@type='button']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    Then I click on element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 13:15')]]/div[@type='button']"
    Then I wait for 1 sec
    Then I click on element with xpath "//button[contains(text(),'Cancel appointment')]"
    And I wait for 1 sec
    And element with xpath "//article[div//h3[contains(text(),'Monday 13 May 2024, 10:00')]]" should not be present
