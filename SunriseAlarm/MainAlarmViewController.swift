import UIKit
import FontAwesome_swift


class MainAlarmViewController: UITableViewController {
	
	@IBOutlet var menuButton: UIBarButtonItem!
	@IBOutlet var addButton: UIBarButtonItem!
   
    var alarmDelegate: AlarmApplicationDelegate = AppDelegate()
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var alarmModel: Alarms = Alarms()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmScheduler.checkNotification()
        tableView.allowsSelectionDuringEditing = true
		Utils.insertGradientIntoTableView(viewController: self, tableView: tableView)
		
		// Nav bar
		let attributes = [NSAttributedStringKey.font: UIFont.fontAwesome(ofSize: 21)]
		addButton.setTitleTextAttributes(attributes, for: .normal)
		addButton.setTitleTextAttributes(attributes, for: .selected)
		addButton.title = String.fontAwesomeIcon(name: .plus)
		menuButton.setTitleTextAttributes(attributes, for: .selected)
		menuButton.setTitleTextAttributes(attributes, for: .normal)
		menuButton.title = String.fontAwesomeIcon(name: .bars)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmModel = Alarms()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	
	@IBAction func menuButtonPressed(_ sender: AnyObject) {
		let storyBoard : UIStoryboard = UIStoryboard(name: Constants.Common.MAIN_STORYBOARD, bundle:nil)
		let settingsView = storyBoard.instantiateViewController(withIdentifier: Constants.Views.SETTINGS) as! Settings
		self.show(settingsView as UIViewController, sender: settingsView)
	}
	
	
    // MARK: - Table view data source
	public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60.0
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let label = UILabel()
		label.backgroundColor = UIColor.clear
		label.textColor = UIColor.white
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.textAlignment = .center
		label.font = UIFont.GothamProRegular(size: 10)
		label.text = "All alarms will trigger 5-15 minutes earlier than the time they are scheduled for ;)"
		return label
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmModel.count
    }
	
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if isEditing {
            performSegue(withIdentifier: Constants.editSegueIdentifier, sender: SegueInfo(curCellIndex: indexPath.row, isEditMode: true, label: alarmModel.alarms[indexPath.row].label, mediaLabel: alarmModel.alarms[indexPath.row].mediaLabel, mediaID: alarmModel.alarms[indexPath.row].mediaID, repeatWeekdays: alarmModel.alarms[indexPath.row].repeatWeekdays, enabled: alarmModel.alarms[indexPath.row].enabled, snoozeEnabled: alarmModel.alarms[indexPath.row].snoozeEnabled))
//        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.alarmCellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: Constants.alarmCellIdentifier)
        }
		
		// Style
		cell!.backgroundColor = UIColor.clear
		cell!.textLabel?.textColor = UIColor.white
		cell!.detailTextLabel?.textColor = UIColor.white
		cell!.detailTextLabel?.font = UIFont.GothamProRegular(size: 16.0)
		cell!.selectionStyle = .none
		
        // text
        cell!.tag = indexPath.row
        let alarm: Alarm = alarmModel.alarms[indexPath.row]
		let amAttr: [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.GothamProMedium(size: 25.0)!]
        let str = NSMutableAttributedString(string: alarm.formattedTime, attributes: amAttr)
		let timeAttr: [NSAttributedStringKey : Any] = [NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue) : UIFont.GothamProMedium(size: 40.0)!]
        str.addAttributes(timeAttr, range: NSMakeRange(0, str.length-2))
        cell!.textLabel?.attributedText = str
        cell!.detailTextLabel?.text = alarm.label + ", " + WeekdaysViewController.repeatText(weekdays: alarm.repeatWeekdays)
		
        // switch button
        let switchButton = UISwitch(frame: CGRect())
        switchButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
        
        // tag is used to indicate which row had been touched
        switchButton.tag = indexPath.row
        switchButton.addTarget(self, action: #selector(MainAlarmViewController.switchTapped(_:)), for: UIControlEvents.valueChanged)
        if alarm.enabled {
            cell!.textLabel?.alpha = 1.0
            cell!.detailTextLabel?.alpha = 1.0
            switchButton.setOn(true, animated: false)
			switchButton.onTintColor = UIColor(hex: Constants.Colors.MAIN_COLOR_2)
        }
		else {
            cell!.textLabel?.alpha = 0.5
            cell!.detailTextLabel?.alpha = 0.5
        }
        cell!.accessoryView = switchButton
        
        return cell!
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        let index = sender.tag
        alarmModel.alarms[index].enabled = sender.isOn
        if sender.isOn {
            alarmScheduler.setNotificationWithDate(alarmModel.alarms[index].secretDate, onWeekdaysForNotify: alarmModel.alarms[index].repeatWeekdays, snoozeEnabled: alarmModel.alarms[index].snoozeEnabled, onSnooze: false, soundName: alarmModel.alarms[index].mediaLabel, index: index)
            tableView.reloadData()
        }
        else {
            alarmScheduler.reSchedule()
            tableView.reloadData()
        }
    }
	
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let index = indexPath.row
            alarmModel.alarms.remove(at: index)
            let cells = tableView.visibleCells
            for cell in cells {
                let sw = cell.accessoryView as! UISwitch
                //adjust saved index when row deleted
                if sw.tag > index {
                    sw.tag -= 1
                }
            }
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            alarmScheduler.reSchedule()
        }   
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dist = segue.destination as! UINavigationController
        let addEditController = dist.topViewController as! AlarmAddEditViewController
        if segue.identifier == Constants.addSegueIdentifier {
            addEditController.navigationItem.title = "Add Alarm"
            addEditController.segueInfo = SegueInfo(curCellIndex: alarmModel.count, isEditMode: false, label: "Alarm", mediaLabel: "Bell", mediaID: "", repeatWeekdays: [Date().dayNumberOfWeek()!], enabled: false, snoozeEnabled: false)
        }
        else if segue.identifier == Constants.editSegueIdentifier {
            addEditController.navigationItem.title = "Edit Alarm"
            addEditController.segueInfo = sender as! SegueInfo
        }
    }
    
    @IBAction func unwindFromAddEditAlarmView(_ segue: UIStoryboardSegue) {
        isEditing = false
    }
    
    public func changeSwitchButtonState(index: Int) {
        //let info = notification.userInfo as! [String: AnyObject]
        //let index: Int = info["index"] as! Int
        alarmModel = Alarms()
        if alarmModel.alarms[index].repeatWeekdays.isEmpty {
            alarmModel.alarms[index].enabled = false
        }
        let cells = tableView.visibleCells
        for cell in cells {
            if cell.tag == index {
                let sw = cell.accessoryView as! UISwitch
                if alarmModel.alarms[index].repeatWeekdays.isEmpty {
                    sw.setOn(false, animated: false)
                    cell.backgroundColor = UIColor.groupTableViewBackground
                    cell.textLabel?.alpha = 0.5
                    cell.detailTextLabel?.alpha = 0.5
                }
            }
        }
    }
}
