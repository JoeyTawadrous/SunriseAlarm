import UIKit
import SCLAlertView


class Dialogs {
	class func showOkButtonDialog(view: UIViewController, message: String) {
		let appearance = SCLAlertView.SCLAppearance(
			kCircleHeight: 100.0,
			kCircleIconHeight: 60.0,
			kTitleTop: 62.0
		)
		
		let alertView = SCLAlertView(appearance: appearance)
		let alertViewIcon = UIImage(named: "diamond")
		
		alertView.showCustom(Constants.Strings.ALERT_DIALOG_INFO, subTitle: message, color: UIColor(hex: Constants.Colors.ORANGE), icon: alertViewIcon!, animationStyle: .leftToRight)
	}
}
