package com.HamzaLambara.calculator;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest {

    private Calculator calculator = new Calculator();

    @Test
    public void testSum() {
        assertEquals(8, calculator.sum(3, 5));
    }
}


