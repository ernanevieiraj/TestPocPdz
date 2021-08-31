package runner;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/java/resources/features/Cliente.feature",
                tags="@RequisicaoPostTodosCamposEmBranco",
                glue = {"Steps"}, monochrome = true, dryRun = false)
public class runner {

}
