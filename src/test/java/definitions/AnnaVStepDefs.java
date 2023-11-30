package definitions;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class AnnaVStepDefs {
    @Given("AnnaV launch {string}")
    public void annavLaunch(String sApplicationName) {


        switch(sApplicationName) {
            case "MedicenterV2":
                getDriver().get(XpathLibrary.sMedicenterURLV2);
                break;
            case "MedicenterV1":
                getDriver().get(XpathLibrary.sMedicenterURLV1);
                break;
            case "Google":
                getDriver().get(XpathLibrary.sGoogleURL);
                break;
            default:
                System.out.println("No URL found with this name");
        }


    }

    @Then("AnnaV page title is {string}")
    public void annavPageTitleIs(String sPageTitle) {
        assertThat(getDriver().getTitle().contains(sPageTitle));
    }

    @Then("AnnaV click on {string} button")
    public void annavClickOnButton(String sButton) {
        switch (sButton){
            case "Login":
              getDriver().findElement(By.xpath(XpathLibrary.sLoginButton)).click();
            case "Sign in":
              getDriver().findElement(By.xpath(XpathLibrary.sSignInButton)).click();
            default:
                System.out.println("There is not such button");
        }
    }

    @And("AnnaV type {string} into {string} textfield")
    public void annavTypeIntoTextfield(String sText, String sTextFieldName) {
        switch (sTextFieldName){
            case "Email":  getDriver().findElement(By.xpath(XpathLibrary.sEmailTextField)).sendKeys(sText);
            case "Password": getDriver().findElement(By.xpath(XpathLibrary.sPasswordTextField)).sendKeys(sText);

        }
    }
}
