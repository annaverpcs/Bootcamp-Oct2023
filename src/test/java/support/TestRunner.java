package support;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {"pretty", "html:target/report.html", "json:target/report.json"},
        features = "src/test/resources/features",
        glue = {"definitions", "support"},
<<<<<<< HEAD
        tags = "@predefined"// same as VM option -Dcucumber..filter.tags="@predefined1 or @predefined2"
=======
        tags = "@medicenter" // same as VM option -Dcucumber..filter.tags="@predefined1 or @predefined2"
>>>>>>> 1b58c518eef93a918dcc7b09298ee728bc569ab6
)
public class TestRunner {
    @BeforeClass
    public static void setup() {
    }

    @AfterClass
    public static void teardown() {
    }
}
