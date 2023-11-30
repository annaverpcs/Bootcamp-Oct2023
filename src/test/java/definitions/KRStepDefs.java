package definitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.openqa.selenium.By;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class KRStepDefs {
    @Given("KR launch {string}")
    public void krLaunch(String sApplicationName) {

        switch (sApplicationName) {
            case "MedicenterV2":
                getDriver().get(XpathLibrary.sMedicenterURLv2);
                break;
            case "MedicenterV1":
                getDriver().get(XpathLibrary.sMedicenterURLv1);
                break;
            case "Google":
                getDriver().get(XpathLibrary.sGoogleURL);
                break;
            default:
                System.out.println("No URL found with this name");
        }
    }

    @Then("KR page title is {string}")
    public void krPageTitleIs(String sPageTitle) {
        assertThat(getDriver().getTitle().contains(sPageTitle));

    }

    @Then("KR click on {string} button")
    public void krClickOnButton(String sButton) {
        switch (sButton) {
            case "Login": getDriver().findElement(By.xpath(XpathLibrary.sLoginButton)).click();
            case "Sign in": getDriver().findElement(By.xpath(XpathLibrary.sSignInButton)).click();
            default:
                System.out.println("There is not such button");
        }
    }

    @Then("KR type {string} into {string} textfield")
    public void krTypeIntoTextfield(String sText, String sTextFieldName) {
        switch (sTextFieldName) {
            case "Email": getDriver().findElement(By.xpath(XpathLibrary.sEmailTextField)).sendKeys(sText);
            break;
            case "Password": getDriver().findElement(By.xpath(XpathLibrary.sPasswordTextField)).sendKeys(sText);
            break;
        }
    }
}
