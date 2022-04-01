package Ztrain_API.Cart;

import com.intuit.karate.junit5.Karate;

public class RunnerCart {
    @Karate.Test
    Karate testUser() {
        return Karate.run().relativeTo(getClass());
    }
}