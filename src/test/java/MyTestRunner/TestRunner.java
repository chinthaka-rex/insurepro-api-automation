package MyTestRunner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import org.junit.Test;
import util.ExtentReportGen;

@KarateOptions(
        //tags = "@Smoke",
        features = "classpath:Features"
)
public class TestRunner {
    @Test
    public void executeKarateTest() {
        Results result = Runner.parallel(getClass(), 2);

        ExtentReportGen extentReport = new ExtentReportGen()
                .withKarateResult(result)
                .withReportDir("reports")
                .withReportTitle("CW Test Automation Project");
        extentReport.generateExtentReport();
    }
}
