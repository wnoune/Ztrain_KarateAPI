package Ztrain_API;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ZtrainTestAPI {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}