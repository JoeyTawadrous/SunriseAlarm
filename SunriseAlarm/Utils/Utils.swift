import UIKit
import MessageUI
import FontAwesome_swift


class Utils {
	
	/* MARK: Colors
	/////////////////////////////////////////// */
	class func getMainColor() -> UIColor {
		return UIColor(hex: Utils.getCurrentTheme()[0])
	}
	
	class func getCurrentTheme() -> [String] {
		if Utils.contains(key: Constants.Defaults.CURRENT_THEME) {
			return Constants.Purchases.Colors[Utils.string(key: Constants.Defaults.CURRENT_THEME)]!
		}
		else {
			return Constants.Purchases.Colors[Constants.Purchases.SUNRISE_THEME]!
		}
	}
	
	class func insertGradientIntoView(viewController: UIViewController) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = viewController.view.frame.size
		gradientLayer.colors = [UIColor(hex: Utils.getCurrentTheme()[0]).cgColor, UIColor(hex: Utils.getCurrentTheme()[1]).cgColor]
		gradientLayer.name = "999"
		
		// remove layer if it was previously added
		if viewController.view.layer.sublayers?.first?.name == "999" {
			viewController.view.layer.sublayers?.first?.removeFromSuperlayer()
		}
		
		viewController.view.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	class func insertGradientIntoTableView(viewController: UIViewController, tableView: UITableView) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = viewController.view.frame.size
		gradientLayer.colors = [UIColor(hex: Utils.getCurrentTheme()[0]).cgColor, UIColor(hex: Utils.getCurrentTheme()[1]).cgColor]
		
		let bgView = UIView.init(frame: tableView.frame)
		bgView.layer.insertSublayer(gradientLayer, at: 0)
		tableView.backgroundView = bgView
	}
	
	class func insertGradientIntoCell(view: UIView, color1: String, color2: String) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = view.frame.size
		gradientLayer.colors = [UIColor(hex: color1).cgColor, UIColor(hex: color2).cgColor]
		view.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	
	
	/* MARK: Data
	/////////////////////////////////////////// */
	class func bool(key: String) -> Bool {
		return UserDefaults.standard.bool(forKey: key)
	}
	
	class func double(key: String) -> Double {
		return UserDefaults.standard.double(forKey:key)
	}
	
	class func int(key: String) -> Int {
		return UserDefaults.standard.integer(forKey:key)
	}
	
	class func object(key: String) -> Any {
		return UserDefaults.standard.object(forKey: key)!
	}
	
	class func string(key: String) -> String {
		return UserDefaults.standard.string(forKey: key)!
	}
	
	class func contains(key: String) -> Bool {
		return UserDefaults.standard.object(forKey: key) != nil
	}
	
	class func set(key: String, value: Any) {
		UserDefaults.standard.set(value, forKey: key)
	}
	
	class func remove(key: String) {
		UserDefaults.standard.removeObject(forKey: key)
	}
	
	
	
	// MARK: Social
	/////////////////////////////////////////// */
	class func openURL(url: String) {
		let url = URL(string: url)!
		if #available(iOS 10.0, *) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		} else {
			UIApplication.shared.openURL(url)
		}
	}
	
	
	class func openShareView(viewController: UIViewController) {
		let share = Constants.Strings.SHARE
		let link : NSURL = NSURL(string: Constants.Strings.LINK_IOS_STORE)!
		let logo: UIImage = UIImage(named: Constants.Design.LOGO)!
		
		let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [share, link, logo], applicationActivities: nil)
		
		// This lines is for the popover you need to show in iPad
		activityViewController.popoverPresentationController?.sourceView = viewController.view
		
		// This line remove the arrow of the popover to show in iPad
		activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
		activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
		
		// Anything you want to exclude
		activityViewController.excludedActivityTypes = [
			UIActivityType.postToWeibo,
			UIActivityType.print,
			UIActivityType.assignToContact,
			UIActivityType.saveToCameraRoll,
			UIActivityType.addToReadingList,
			UIActivityType.postToFlickr,
			UIActivityType.postToVimeo,
			UIActivityType.postToTencentWeibo
		]
		
		viewController.present(activityViewController, animated: true, completion: nil)
	}
	
	
	
	// MARK: Visual
	/////////////////////////////////////////// */
	class func getViewController(_ viewName: String) -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewController(withIdentifier: viewName) as UIViewController
		return vc
	}
	
	class func presentView(_ view: UIViewController, viewName: String) {
		view.present(getViewController(viewName), animated: true, completion: nil)
	}
	
	class func pushView(_ view: UIViewController, viewName: String) {
		view.navigationController?.pushViewController(getViewController(viewName), animated: true)
	}
	
	class func createFontAwesomeBarButton(button: UIBarButtonItem, icon: FontAwesome, style: FontAwesomeStyle) {
		var attributes = [NSAttributedStringKey : Any]()
		attributes = [.font: UIFont.fontAwesome(ofSize: 21, style: style)]
		button.setTitleTextAttributes(attributes, for: .normal)
		button.setTitleTextAttributes(attributes, for: .selected)
		button.title = String.fontAwesomeIcon(name: icon)
	}
}
