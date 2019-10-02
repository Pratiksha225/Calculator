//Name: Pratiksha Kathiriya
//StudentId: 301093309
//Description: Application which performs +,-,×,÷ on two or more operands
//Date: 2nd Oct,19.
//Version History: v2- added functionality for buttons
import UIKit

class ViewController: UIViewController
{

    private var m_operand = "0"
    private var m_currentValue = 0.0
    private var m_currentOperation = Operation.none
    @IBOutlet weak var Result: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        Result.text = "0"
    }
    
    @IBAction func onClick(_ sender: UIButton)
    {
        var calculatorButton = sender.titleLabel?.text
        
        switch(calculatorButton)
        {
        case "AC":
            m_operand = "0"
            m_currentValue=0.0
            Result.text = m_operand
            break
            
        case ".":
            if(!(Result.text?.contains("."))!)
            {
                m_operand += calculatorButton!
            }
            
        case "+":
            m_currentOperation = Operation.add
            m_currentValue += Double(m_operand) as! Double
            m_operand = "0"
            Result.text = String(m_currentValue)
            break
            
        case "-":
            m_currentOperation = Operation.subtract
            m_currentValue -= Double(m_operand) as! Double
            m_operand = "0"
            Result.text = String(m_currentValue)
            break
            
        case "×":
            break
        case "÷":
            break
        case "=":
            
            // complete the last operation
            Result.text = String(m_currentValue)
            break
        case "←":
            m_operand = String(m_operand.dropLast())
            if(m_operand.count == 0)
            {
                m_operand = "0"
            }
            Result.text = m_operand
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
            
            Result.text = m_operand
        }
        
    }


}

