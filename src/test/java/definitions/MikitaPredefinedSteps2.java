package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;

public class MikitaPredefinedSteps2 {


        @Given("Nikita launch {string}")
        public void nikitalaunch(String url) {
            getDriver().get(MikitaXpathLibrary.MedicalCenterV2);
        }

        @Then("Nikita click {string}")
        public void nikitaClick(String element) {
            getDriver().findElement(By.xpath(MikitaXpathLibrary.LoginButton)).click();
        }


    @Then("Nikita click to sign in {string}")
    public void nikitaClickToSignIn(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.SignInButton)).click();
    }

    @Then("Nikita click to create appointment {string}")
    public void nikitaClickToCreateAppointment(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.MakeAnAppointmentButton)).click();
    }


    @Then("Nikita click save {string}")
    public void nikitaClickSave(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.SaveButton)).click();
    }

    @Then("Nikita click delete {string}")
    public void nikitaClickDelete(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.CancelButton)).click();
    }

    @Then("Nikita click cancel {string}")
    public void nikitaClickCancel(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.CancelAppointmentButton)).click();
    }

    @Then("Nikita click logout {string}")
    public void nikitaClickLogout(String element) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.LogoutButton)).click();
    }
    @Then("Nikita select specialist {string}")
    public void nikitaSelectSpecialist(String specialist) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.SpecialistOption)).click();
    }


    @Then("Nikita select time {string}")
    public void nikitaSelectTime(String specialist) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.TimeOption)).click();
    }
        @Then("Nikita wait {int} sec")
        public void nikitaWaitSec(int time) throws InterruptedException {
            getDriver().manage().window().maximize();
            Thread.sleep(3000);
        }


        @Then("Nikita assert element with xpath {string} precent")
        public void nikitaAssertElementWithXpathPresent(String xpath) {
            getDriver().findElement(By.xpath(MikitaXpathLibrary.MedicalCenterText)).isDisplayed();
        }

    @Then("Nikita assert appointment with xpath {string} precent")
    public void nikitaAssertAppointmenttWithXpathPresent(String xpath) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.CreatedAppointmentElement)).isDisplayed();
    }


        @Then("Nikita Title is present")
        public void nikitaTitleIsPresent() {
            assertThat(getDriver().getTitle().contains("Medical Center"));
        }


        @And("Nikita type {string} in field with xpath {string}")
        public void nikitaTypeInFieldWithXpath(String text, String xpath) {
            getDriver().findElement(By.xpath(MikitaXpathLibrary.EmailField)).sendKeys(text);
        }

    @And("Nikita type {string} in password field with xpath {string}")
    public void nikitaTypeInPasswordFieldWithXpath(String text, String xpath) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.YourPasswordField)).sendKeys(text);
    }

    @And("Nikita type {string} in info field with xpath {string}")
    public void nikitaTypeInInfoFieldWithXpath(String text, String xpath) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.InfoPurposeOfAppointmentField)).sendKeys(text);
    }


    @And("Nikita type {string} in date field with xpath {string}")
    public void nikitaTypeInDateFieldWithXpath(String text, String xpath) {
        getDriver().findElement(By.xpath(MikitaXpathLibrary.DateField)).sendKeys(text);
    }



        @And("Nikita should see page title {string}")
        public void nikitaShouldSeePageTitle(String title) {
            assert (getDriver().getTitle().contains(title));
        }
    }
