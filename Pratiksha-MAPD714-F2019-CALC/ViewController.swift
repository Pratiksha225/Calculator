
// NAME:
// STUDENTID:
// DESCRIPTION:
// DATE:
// VERSION HISTORY: v1 - added functionality for buttons
import UIKit

class ViewController: UIViewController {
    
    // Private Instance Variables
    private var m_operand = "0"
    private var m_currentValue: Double = 0.0
    private var m_currentOperation = Operation.none
    
    // Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    // Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    // Actions
    @IBAction func CalculatorButtonClick(_ sender: UIButton) {
        var calculatorButton = sender.titleLabel?.text
        
        switch(calculatorButton)
        {
        case "AC":
            m_operand = "0"
            m_currentValue = 0.0
            resultLabel.text = m_operand
            break
        case ".":
            if(!(resultLabel.text?.contains("."))!)
            {
                m_operand += calculatorButton!
            }
            break
        case "+":
            m_currentOperation = Operation.add
            m_currentValue += Double(m_operand) as! Double
            m_operand = "0"
            resultLabel.text = String(m_currentValue)
            break
        case "-":
            // needs correction - subtracts wrong in a compound operation
            m_currentValue -= Double(m_operand) as! Double
            m_operand = "0"
            resultLabel.text = String(m_currentValue)
            break
        case "x":
            break
        case "÷":
            break
        case "=":
            // complete the last operation
            resultLabel.text = String(m_currentValue)
            break
        case "⇦":
            m_operand = String(m_operand.dropLast())
            if(m_operand.count == 0)
            {
                m_operand = "0"
            }
            resultLabel.text = m_operand
            break
        case "+/-":
            break
        default:
            
            
            if(m_operand == "0")
            {
                m_operand = ""
            }
            m_operand += calculatorButton!
            
            if(m_currentOperation != Operation.none)
            {
                switch(m_currentOperation)
                {
                case .add:
                    break
                case .subtract:
                    break
                case .multiply:
                    break
                case .divide:
                    break
                default:
                    break
                    
                }
            }
            
            resultLabel.text = m_operand
        }
        
    }
    
}
