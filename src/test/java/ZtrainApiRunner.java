import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ZtrainApiRunner {

    @Karate.Test
    Karate testAll() {
        System.setProperty("karate.env", "auto");
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate testTags() {
        System.setProperty("karate.env", "auto");
        return Karate.run().tags("@TEST_OF-728").relativeTo(getClass());
    }

    @Karate.Test
    Karate testUser() {
        return Karate.run().relativeTo(getClass());
    }
}
