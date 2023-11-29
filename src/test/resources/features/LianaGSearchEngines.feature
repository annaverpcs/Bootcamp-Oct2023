Feature: Session 15 beginning
  Scenario: Search Engine for Ekoru.org
    Given I open url "https://ekoru.org/"
    Then I should see page title as "Ekoru - every search cleans our oceans"
    Then element with xpath "//input[@id='fld_q']" should be present
    Then I type "Tomatoes" into element with xpath "//input[@id='fld_q']"
    Then I click on element with xpath "//div[@id='btn_search']"
    And I wait for 2 sec
    Then element with xpath "//input[@id='sb_form_q']" should be present
    Then element with xpath "//input[@id='sb_form_q']" should have attribute "value" as "Tomatoes"