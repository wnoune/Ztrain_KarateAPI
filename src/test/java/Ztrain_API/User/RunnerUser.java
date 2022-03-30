package Ztrain_API.User;

import com.intuit.karate.junit5.Karate;

public class RunnerUser {
    @Karate.Test
    Karate testUser() {
        return Karate.run().relativeTo(getClass());
    }
}