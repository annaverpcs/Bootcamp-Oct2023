package definitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class KRStepDefs {
    @Given("KR launch {string}")
    public void krLaunch(String sApplicationName) {
        getDriver().get("https://medicenter-qa2.vercel.app/");

        switch (sApplicationName) {
            case"MedicenterV2":
                getDriver().get("https://medicenter-qa2.vercel.app/");
                break;
            case"MedicenterV1":
                getDriver().get("https://medicenter-qa1.vercel.app/");
                break;
            case"Google":
                getDriver().get("https://google.com");
                break;
            default:
                System.out.println("No URL found with this name");
        }
    }

    @Then("KR page title is {string}")
    public void krPageTitleIs(String sPageTitle) {
        assertThat(getDriver().getTitle().contains(sPageTitle));

    }
}
