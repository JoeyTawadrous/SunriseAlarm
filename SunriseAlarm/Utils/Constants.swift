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
		static let BLUE = "69CDFC"
		static let GREEN = "2ecc71"
		static let ORANGE = "f39c12"
		static let PURPLE = "B0B1F1"
		static let PRIMARY_TEXT_GRAY = "5D5D5C"
	}
	
	
	struct Core {
		static let APP_ID = "1360309647"
		static let APP_NAME = "Sunrise Alarm"
	}
	
	
	struct Defaults {
		static let INTENT_TO_PURCHASE = "intentToPurchase"
		
		// Upgrade
		static let USER_HAS_MONTHLY_SUBSCRIPTION = "userHasMonthlySubscription"
		static let USER_HAS_YEARLY_SUBSCRIPTION = "userHasYearlySubscription"
		static let USER_HAS_UNLOCKED_APP = "userHasUnlockedApp"
		
		// Themes
		static let CURRENT_THEME = "CurrentTheme"
		static let PURCHASED_THEMES = "PurchasedThemes"
	}
	
	
	struct Design {
		static let LOGO = "Logo"
	}
	
	
	struct Purchases {
		// Upgrade
		static let SHARED_SECRET = "ba174f894115439fa3c75b1fa98d8178"
		static let SUBSCRIPTION_MONTHLY_KEY = "com.joeyt.sunrise.subscription.monthly"
		static let SUBSCRIPTION_YEARLY_KEY = "com.joeyt.sunrise.subscription.yearly"
		static let UNLOCK_KEY = "com.joeyt.sunrise.unlock"
		
		// Themes
		static let THEME_ID_PREFIX = "com.joeyt.sunrise.theme."
		static let GRASSY_THEME = "grassy"
		static let SUNRISE_THEME = "sunrise"
		static let NIGHTLIGHT_THEME = "nightlight"
		static let SALVATION_THEME = "salvation"
		static let RIPE_THEME = "ripe"
		static let MALIBU_THEME = "malibu"
		static let LIFE_THEME = "life"
		static let FIRE_THEME = "fire"
		
		static let Colors: [String : [String]] = [
			GRASSY_THEME: ["96e6a1", "d4fc79"],
			SUNRISE_THEME: ["f6d365", "fda085"],
			NIGHTLIGHT_THEME: ["a18cd1", "fbc2eb"],
			SALVATION_THEME: ["f43b47", "453a94"],
			RIPE_THEME: ["f093fb", "f5576c"],
			MALIBU_THEME: ["4facfe", "00f2fe"],
			LIFE_THEME: ["43e97b", "38f9d7"],
			FIRE_THEME: ["fa709a", "fee140"]
		]
	}
	
	
	struct Strings {
		// Dialog: Alert
		static let ALERT_DIALOG_INFO = "Info"
		
		
		// Links
		static let LINK_APP_REVIEW = "itms-apps://itunes.apple.com/app/apple-store/id" + Core.APP_ID + "?action=write-review"
		static let LINK_FACEBOOK = "https://www.facebook.com/getlearnable"
		static let LINK_INSTAGRAM = "https://www.instagram.com/learnableapp"
		static let LINK_IOS_STORE = "https://itunes.apple.com/gb/app/sunrise-alarm-surprise-clock/id1360309647?mt=8"
		static let LINK_LEARNABLE_IOS_STORE = "https://itunes.apple.com/gb/app/learnable-learn-to-code-from-scratch-level-up/id1254862243?mt=8"
		static let LINK_TWITTER = "https://twitter.com/getlearnable"
		static let LINK_TWITTER_JOEY = "https://twitter.com/joeytawadrous"
		static let LINK_WEB = "http://www.getlearnable.com"
		
		
		// Purchases: Strings
		static let PURCHASE_ERROR_CONTACT_US = " Please contact us."
		static let PURCHASE_ERROR_NOT_AVAILABLE = "The product is not available in the current storefront." + PURCHASE_ERROR_CONTACT_US
		static let PURCHASE_ERROR_IDENTIFIER_INVALID = "The purchase identifier was invalid." + PURCHASE_ERROR_CONTACT_US
		static let PURCHASE_ERROR_CANCELLED = "Your payment was cancelled." + PURCHASE_ERROR_CONTACT_US
		static let PURCHASE_ERROR_NOT_ALLOWED = "You are not allowed to make payments." + PURCHASE_ERROR_CONTACT_US
		static let PURCHASE_ERROR_LOGIN = "You must login to your App Store account before your payment can be completed."
		static let PURCHASE_RESTORE_ERROR = "Restore error." + PURCHASE_ERROR_CONTACT_US
		static let PURCHASE_RESTORE_NOTHING = "You have no purchases to restore!"
		static let PURCHASE_RESTORE_SUCCESS = "You have successfully restored your previous purchases."
		static let PURCHASE_SUCCESS = "Your new theme has been succesfully set. Enjoy :)"
		
		
		// Purchases: Upgrade Strings
		static let UPGRADE_SCREEN_TITLE = "Sunrise Alarm Premium"
		static let UPGRADE_SCREEN_ONE_TITLE = "Unlock Everything"
		static let UPGRADE_SCREEN_ONE_TEXT = "Gain access to all features, themes, sounds & unlockable content."
		static let UPGRADE_SCREEN_TWO_TITLE = "Access Themes"
		static let UPGRADE_SCREEN_TWO_TEXT = "Gain access to our Malibu, Salvation, Nightlight themes & more."
		static let UPGRADE_SCREEN_THREE_TITLE = "Premium Sounds"
		static let UPGRADE_SCREEN_THREE_TEXT = "Gain access to all premium sounds to customize your alarms."
		static let UPGRADE_SCREEN_FOUR_TITLE = "Unlimited Alarms"
		static let UPGRADE_SCREEN_FOUR_TEXT = "Create unlimited alarms & ensure you're never late again."
		static let UPGRADE_SCREENS_MONTHLY_SUBSCRIBE_BUTTON_TITLE = "$1.99 \nmonth"
		static let UPGRADE_SCREENS_YEARLY_SUBSCRIBE_BUTTON_TITLE = "$4.99 \nyear"
		static let UPGRADE_SCREENS_UNLOCK_BUTTON_TITLE = "$6.99 \nonce"
		static let UPGRADE_SCREENS_INFO = "You'll be charged $1.99/month at confirmation of purchase. Your subscription will renew after 1 month unless turned off 24-hours before the end of the subscription period. You can manage this in your App Store settings. For details, see " + Constants.Strings.LINK_WEB
		
		
		// Send Feedback
		static let EMAIL = "joeytawadrous@gmail.com"
		static let SEND_FEEDBACK_SUBJECT = "Sunrise Alarm Feedback!"
		static let SEND_FEEDBACK_BODY = "I want to make Sunrise Alarm better. Here are my ideas... \n\n What I like about Sunrise Alarm: \n 1. \n 2. \n 3. \n\n What I don't like about Sunrise Alarm: \n 1. \n 2. \n 3. \n\n"
		
		
		// Share
		static let SHARE = "Check out " + Constants.Core.APP_NAME + " on the App Store, where you can easily create create alarms that trigger early, so you are never late again! #SunriseAlarm #iOS \n\nDownload for free now: " + Strings.LINK_IOS_STORE
	}
	
	
	struct Views {
		static let MAIN_ALARM_NAV_CONTROLLER = "MainAlarmNavController"
		static let SETTINGS = "Settings"
		static let SETTINGS_NAV_CONTROLLER = "SettingsNavController"
		static let THEMES = "Themes"
		static let THEMES_NAV_CONTROLLER = "ThemesNavController"
		static let UPGRADE = "Upgrade"
	}
}
