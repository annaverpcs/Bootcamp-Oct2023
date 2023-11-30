#Author: Kateryna Rychenkov
  #Jira ID
@medicenter
Feature: Medicenter Negative Test Scenarios

  @medicenter1
  Scenario Outline: Login as administrator with Date Driven with invalid values
    Given I open url "https://medicenter-qa2.vercel.app/"
    Then I should see page title as "Medicenter"
    Then I click on element with xpath "//button[contains(text(),'Login')]"
    Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    Then I type <Email> into element with xpath "//input[@id='email']"
    And I type <Password> into element with xpath "//input[@id='password']"
    Then I wait for 5 sec
    And I click on element with xpath "//button[@type ='submit']"
    Then I wait for element with xpath "//span[contains(text(),'Invalid login credentials')]" to be present
    And element with xpath "//span[contains(text(),'Invalid login credentials')]" should contain text <InvalidValues>
    Examples:
      | Email                        | Password | InvalidValues      |
      | "coephillips@netscapezs"     | "zxc123" | "Invalid login credentials" |
      | "coephillips@netscapezs.com" | "wrong"  | "Invalid login credentials" |
      | "coephillipsnetscapezs.com"  | "zxc123" | "Invalid credentials" |

  Scenario: Login as administrator with Selenium WebDriver methods
    #Given I open url "https://medicenter-qa2.vercel.app/"
    Given KR launch "MedicenterV2"
    Then KR page title is "Medicenter"
    And I wait for 2 sec


    # Given KR launch "MedicenterV1"
    #Then I should see page title as "Medicenter"
            #Login as administrator
    #Then I click on element with xpath "//button[contains(text(),'Login')]"
    #Then I wait for element with xpath "//a[contains(text(),'Back to home')]" to be present
    #Then I type "coephillips@netscapezs.com" into element with xpath "//input[@id='email']"
    #And I type "zxc123" into element with xpath "//input[@id='password']"
    #And I click on element with xpath "//button[@type ='submit']"
    #Then I wait for element with xpath "//h1[contains(text(),'Medical Center')]" to be present
    #Then I wait for element with xpath "//h1[contains(text(),'Admin Test')]" to be present
    #And element with xpath "//h1[contains(text(),'Admin Test')]" should contain text "Admin Test"