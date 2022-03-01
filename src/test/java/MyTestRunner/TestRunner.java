package MyTestRunner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;
import util.ConfigReader;
import util.CreateZip;
import util.ExtentReport;

import java.io.IOException;
import java.util.Properties;

@KarateOptions(
        //tags = "@smoke",
        features = "classpath:Features/AddUsers.feature"
)
public class TestRunner {
    Properties prop;

    @Test
    public void executeKarateTest() {
        ConfigReader configReader = new ConfigReader();
        prop = configReader.init_prop();

        Results result = Runner.parallel(getClass(), Integer.parseInt(prop.getProperty("parallel_thread_count")));
        generateExtentReport(result);
    }

    public void generateExtentReport(Results result) {
        CreateZip createZip = new CreateZip();
        createZip.zipDirectory(prop.getProperty("report_out"));

        ExtentReport extentReport = new ExtentReport()
                .withKarateResult(result)
                .withReportDir(prop.getProperty("report_out"))
                .withReportTitle(prop.getProperty("extent_report_title"));
        extentReport.generateExtentReport();

        try {
            createZip.zipTheFile(prop.getProperty("report_out"), prop.getProperty("zip_out"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
