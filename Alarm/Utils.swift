import UIKit

class Utils {
	class func insertGradientIntoView(viewController: UIViewController) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = viewController.view.frame.size
		gradientLayer.colors = [UIColor(hex: Colors.MAIN_COLOR_1).cgColor, UIColor(hex: Colors.MAIN_COLOR_2).cgColor]
		viewController.view.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	class func insertGradientIntoTableView(viewController: UIViewController, tableView: UITableView) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = viewController.view.frame.size
		gradientLayer.colors = [UIColor(hex: Colors.MAIN_COLOR_1).cgColor, UIColor(hex: Colors.MAIN_COLOR_2).cgColor]
		let bgView = UIView.init(frame: tableView.frame)
		bgView.layer.insertSublayer(gradientLayer, at: 0)
		tableView.backgroundView = bgView
	}
}
