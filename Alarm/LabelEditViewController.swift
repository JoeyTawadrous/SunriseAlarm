import UIKit

class LabelEditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var labelTextField: UITextField!
    var label: String!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTextField.becomeFirstResponder()
        self.labelTextField.delegate = self
		
		Utils.insertGradientIntoView(viewController: self)
        
        labelTextField.text = label
		labelTextField.textColor = UIColor.white
		labelTextField.font = UIFont.GothamProRegular(size: 17.0)
		labelTextField.layer.addBorder(edge: UIRectEdge.top, color: UIColor.white, thickness: 1)
		labelTextField.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.white, thickness: 1)

        
        //defined in UITextInputTraits protocol
        labelTextField.returnKeyType = UIReturnKeyType.done
        labelTextField.enablesReturnKeyAutomatically = true
    }
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        label = textField.text!
        performSegue(withIdentifier: Constants.labelUnwindIdentifier, sender: self)
        return false
    }
}



extension CALayer {
	func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
		
		let border = CALayer()
		
		switch edge {
		case UIRectEdge.top:
			border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
			break
		case UIRectEdge.bottom:
			border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
			break
		case UIRectEdge.left:
			border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
			break
		case UIRectEdge.right:
			border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
			break
		default:
			//For Center Line
			border.frame = CGRect(x: self.frame.width/2 - thickness, y: 0, width: thickness, height: self.frame.height)
			break
		}
		
		border.backgroundColor = color.cgColor;
		self.addSublayer(border)
	}
}
