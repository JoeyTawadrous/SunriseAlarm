import Foundation

struct Constants {
    static let stopIdentifier = "Alarm-ios-swift-stop"
    static let snoozeIdentifier = "Alarm-ios-swift-snooze"
    static let addSegueIdentifier = "addSegue"
    static let editSegueIdentifier = "editSegue"
    static let saveSegueIdentifier = "saveEditSegue"
    static let soundSegueIdentifier = "soundSegue"
    static let labelSegueIdentifier = "labelEditSegue"
    static let weekdaysSegueIdentifier = "weekdaysSegue"
    static let settingIdentifier = "setting"
    static let musicIdentifier = "musicIdentifier"
    static let alarmCellIdentifier = "alarmCell"
    
    static let labelUnwindIdentifier = "labelUnwindSegue"
    static let soundUnwindIdentifier = "soundUnwindSegue"
    static let weekdaysUnwindIdentifier = "weekdaysUnwindSegue"
	
	
	struct Colors {
		static let MAIN_COLOR_1 = "f6d365"
		static let MAIN_COLOR_2 = "fda085"
		static let SETTINGS_HEADER_TEXT_GRAY = "8c8c8b"
	}
	
	
	struct Common {
		static let APP_ID = "1360309647"
		static let MAIN_STORYBOARD = "Main"
		
		static let LINK_APP_REVIEW = "itms-apps://itunes.apple.com/app/apple-store/id" + Common.APP_ID
		static let LINK_FACEBOOK = "https://www.facebook.com/getlearnable"
		static let LINK_INSTAGRAM = "https://www.instagram.com/learnableapp"
		static let LINK_IOS_STORE = "https://itunes.apple.com/gb/app/sunrise-alarm-surprise-clock/id1360309647?mt=8"
		static let LINK_LEARNABLE_IOS_STORE = "http://apple.co/2vgq8hY"
		static let LINK_TWITTER = "https://twitter.com/getlearnable"
	}
	
	
	struct Design {
		static let LOGO = "AppIcon"
	}
	
	
	struct Strings {
		// Send Feedback
		static let EMAIL = "joeytawadrous@gmail.com"
		static let SEND_FEEDBACK_SUBJECT = "Learnable Feedback for iOS"
		static let SEND_FEEDBACK_BODY = "Hi Learnable, \n\n Possible feedback you could send us: \n\n - I just wanted to say that you're doing a great job and the app is really helping me learn how to code. I'm going to leave you a positive review / share with my friends now. \n - I have a suggestion for a feature.. \n - I found a bug! \n\nPLEASE REPLACE ABOVE TEXT WITH YOUR OWN FEEDBACK."
		static let EMAIL_CLOSING = "\n\nThanks again, and have an amazing day!"
		
		
		// Share
		static let SHARE = "Learn to code in byte-sized lessons anywhere! \n\nWith Learnables course structure, interactive lessons, challenges, tips & feedback, learning to code has never been so easy. \n\nDownload for free now: " + Common.LINK_IOS_STORE
	}
	
	
	struct Views {
		static let SETTINGS = "Settings"
	}
}
