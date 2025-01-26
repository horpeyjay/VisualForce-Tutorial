public class CalculatorController {
    public String display { get; set; }
    public String currentInput { get; set; }
    private String operator;
    private Double operand1;
    private Double operand2;

    // List of buttons for the UI
    public List<String> getButtons() {
        return new List<String>{'7', '8', '9', '/', '4', '5', '6', '*', '1', '2', '3', '-', '0', '.', '+', 'C'};
    }

    // Handle button clicks
    public void processInput() {
        if (currentInput == 'C') {
            // Clear the display and reset
            display = '';
            operand1 = null;
            operand2 = null;
            operator = null;
        } else if (currentInput == '+' || currentInput == '-' || currentInput == '*' || currentInput == '/') {
            // Save the operator and first operand
            operator = currentInput;
            operand1 = Double.valueOf(display);
            display = '';
        } else {
            // Update the display for numeric input
            display += currentInput;
        }
    }

    // Perform calculation
    public void calculate() {
        if (operator != null && display != '') {
            operand2 = Double.valueOf(display);
            switch on operator {
                when '+' { display = String.valueOf(operand1 + operand2); }
                when '-' { display = String.valueOf(operand1 - operand2); }
                when '*' { display = String.valueOf(operand1 * operand2); }
                when '/' {
                    if (operand2 != 0) {
                        display = String.valueOf(operand1 / operand2);
                    } else {
                        display = 'Error'; // Division by zero
                    }
                }
            }
            // Reset for the next calculation
            operator = null;
            operand1 = null;
            operand2 = null;
        }
    }
}
