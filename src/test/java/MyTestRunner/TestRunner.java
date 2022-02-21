package MyTestRunner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.Test;
import util.ExtentReportGen;

//@RunWith(Karate.class)
//@KarateOptions(features = "classpath:Features")
public class TestRunner {
    @Test
    public void executeKarateTest() {
        Builder aRunner = new Builder();
        aRunner.path("classpath:Features");
        Results result = aRunner.parallel(1);

        ExtentReportGen extentReport = new ExtentReportGen()
                .withKarateResult(result)
                .withReportDir(result.getReportDir())
                .withReportTitle("CW Test Automation Project");
        extentReport.generateExtentReport();
    }
}
