package ru.itis.bongodev.bongonet;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BongoNetApplicationTests {

    @Test
    void contextLoads() {
    }

    @Test
    void whenNumberIsEven() {
        int a = 2;
        Assertions.assertEquals(0, a % 2);
    }

}
