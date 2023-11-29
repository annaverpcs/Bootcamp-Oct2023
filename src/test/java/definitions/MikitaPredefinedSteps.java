package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;


import static support.TestContext.getDriver;
import static org.assertj.core.api.Assertions.assertThat;




public class MikitaPredefinedSteps {
    @Given("Mikita launch {string}")
    public void mikitalaunch(String url) {
        getDriver().get(url);
    }

    @Then("Mikita click {string}")
    public void mikitaClick(String element) {
        getDriver().findElement(By.xpath(element)).click();
    }


    @Then("Mikita wait {int} sec")
    public void mikitaWaitSec(int time) throws InterruptedException {
        getDriver().manage().window().maximize();
        Thread.sleep(3000);
    }


    @Then("Mikita assert element with xpath {string} precent")
    public void mikitaAssertElementWithXpathPresent(String xpath) {
        getDriver().findElement(By.xpath(xpath)).isDisplayed();
    }


    @Then("Mikita Title is present")
    public void mikitaTitleIsPresent() {
        assertThat(getDriver().getTitle().contains("Medical Center"));
    }


    @And("Mikita type {string} in field with xpath {string}")
    public void mikitaTypeInFieldWithXpath(String text, String xpath) {
        getDriver().findElement(By.xpath(xpath)).sendKeys(text);
    }


    @And("Mikita should see page title {string}")
    public void mikitaShouldSeePageTitle(String title) {
        assert (getDriver().getTitle().contains(title));
    }

    @And("Mikita try diff doctors {string}")
    public void mikitaTryDiffDoctors(String specialist) {
        switch (specialist) {
            case "specialist1":
                getDriver().findElement(By.xpath("//option[1]")).click();

            case "specialist2":
                getDriver().findElement(By.xpath("//option[2]")).click();

            case "specialist3":
                getDriver().findElement(By.xpath("//option[3]")).click();

            case "specialist4":
                getDriver().findElement(By.xpath("//option[4]")).click();

            case "specialist5":
                getDriver().findElement(By.xpath("//option[5]")).click();

            case "specialist6":
                getDriver().findElement(By.xpath("//option[6]")).click();

            case "specialist7":
                getDriver().findElement(By.xpath("//option[7]")).click();

            case "specialist8":
                getDriver().findElement(By.xpath("//option[8]")).click();

            case "specialist9":
                getDriver().findElement(By.xpath("//option[9]")).click();

            case "specialist10":
                getDriver().findElement(By.xpath("//option[10]")).click();

            case "specialist11":
                getDriver().findElement(By.xpath("//option[11]")).click();

            case "specialist12":
                getDriver().findElement(By.xpath("//option[12]")).click();

            case "specialist13":
                getDriver().findElement(By.xpath("//option[13]")).click();

            case "specialist14":
                getDriver().findElement(By.xpath("//option[14]")).click();
        }

    }
}
