package Ztrain_API.Product;

import com.intuit.karate.junit5.Karate;

public class RunnerProduct {
    @Karate.Test
    Karate testUser() {
        return Karate.run().relativeTo(getClass());
    }
}