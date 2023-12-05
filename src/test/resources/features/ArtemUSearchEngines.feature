Feature: Session 15 beggining
  Scenario: Search Engine for Ekoru.org
    Given I open url "https://en.wikipedia.org/wiki/Main_Page"
    Then I should see page title as "Wikipedia, the free encyclopedia"
    Then element with xpath "//input[@id='searchInput']" should be present
    Then I type "tomato" into element with xpath "//input[@id='searchInput']"
    Then I click on element with xpath "/html[1]/body[1]/div[1]/header[1]/div[2]/div[1]/div[1]/div[1]/form[1]/button[1]"
    And I wait for 7 sec
    Then element with xpath "//span[contains(text(),'Tomato')]" should be present





