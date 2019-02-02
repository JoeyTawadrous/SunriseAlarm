import UIKit
import Foundation
import MediaPlayer

class AlarmAddEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var alarmScheduler: AlarmSchedulerDelegate = Scheduler()
    var alarmModel: Alarms = Alarms()
    var segueInfo: SegueInfo!
    var snoozeEnabled: Bool = false
    var enabled: Bool!
	
	
	override func viewDidLoad() {
		Utils.insertGradientIntoView(viewController: self)
	}
	
    override func viewWillAppear(_ animated: Bool) {
        alarmModel = Alarms()
        tableView.reloadData()
        snoozeEnabled = segueInfo.snoozeEnabled
		datePicker.setValue(UIColor.white, forKeyPath: "textColor")
		
		// Set date picker to alarams date
		if segueInfo.isEditMode {
			let index = segueInfo.curCellIndex
			datePicker.date = alarmModel.alarms[index].date
		}
			
        super.viewWillAppear(animated)
    }
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
    
    @IBAction func saveEditAlarm(_ sender: AnyObject) {
        let date = Scheduler.correctSecondComponent(date: datePicker.date)
        let index = segueInfo.curCellIndex
        var tempAlarm = Alarm()
        tempAlarm.date = date
        tempAlarm.label = segueInfo.label
        tempAlarm.enabled = true
        tempAlarm.mediaLabel = segueInfo.selectedSound
        tempAlarm.mediaID = segueInfo.mediaID
        tempAlarm.snoozeEnabled = snoozeEnabled
        tempAlarm.repeatWeekdays = segueInfo.repeatWeekdays
        tempAlarm.uuid = UUID().uuidString
        tempAlarm.onSnooze = false
		
		
		// Take random number of minutes from date
		// Use arc4random_uniform(n) for a random integer between 0 and n-1
		let randomNum = arc4random_uniform(11) + 5;
		let secretDate = date.addingTimeInterval(TimeInterval(-Int(randomNum) * 60))
		tempAlarm.secretDate = secretDate
		
		
        if segueInfo.isEditMode {
            alarmModel.alarms[index] = tempAlarm
        }
        else {
            alarmModel.alarms.append(tempAlarm)
        }
        self.performSegue(withIdentifier: Constants.saveSegueIdentifier, sender: self)
    }
    
 
    func numberOfSections(in tableView: UITableView) -> Int {
        if segueInfo.isEditMode {
            return 2
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        else {
            return 1
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.settingIdentifier)
        if(cell == nil) {
        	cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: Constants.settingIdentifier)
        }
		
		// Style
		cell!.backgroundColor = UIColor.clear
		cell!.textLabel?.textColor = UIColor.white
		cell!.textLabel?.font = UIFont.GothamProRegular(size: 17.0)
		cell!.detailTextLabel?.textColor = UIColor.white
		cell!.detailTextLabel?.font = UIFont.GothamProRegular(size: 17.0)
		cell!.selectionStyle = .none
		
        if indexPath.section == 0 {
            if indexPath.row == 0 {
				cell!.textLabel!.text = "Label"
				cell!.detailTextLabel!.text = segueInfo.label
				cell!.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            else if indexPath.row == 1 {
				cell!.textLabel!.text = "Repeat"
				cell!.detailTextLabel!.text = WeekdaysViewController.repeatText(weekdays: segueInfo.repeatWeekdays)
				cell!.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
            else if indexPath.row == 2 {
                cell!.textLabel!.text = "Sound"
                cell!.detailTextLabel!.text = segueInfo.selectedSound
                cell!.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            }
//            else if indexPath.row == 3 {
//                cell!.textLabel!.text = "Snooze"
//                let switchButton = UISwitch(frame: CGRect())
//				switchButton.onTintColor = UIColor(hex: Colors.MAIN_COLOR_1)
//                switchButton.addTarget(self, action: #selector(AlarmAddEditViewController.snoozeSwitchTapped(_:)), for: UIControlEvents.touchUpInside)
//
//                if snoozeEnabled {
//                    switchButton.setOn(true, animated: false)
//                }
//                
//                cell!.accessoryView = switchButton
//            }
        }
        else if indexPath.section == 1 {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: Constants.settingIdentifier)
            cell!.textLabel!.text = "Delete Alarm"
            cell!.textLabel!.textAlignment = .center
			
			cell!.backgroundColor = UIColor.clear
			cell!.textLabel?.textColor = UIColor.red
        }
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if indexPath.section == 0 {
            switch indexPath.row{
            case 0:
				performSegue(withIdentifier: Constants.labelSegueIdentifier, sender: self)
				cell?.setSelected(true, animated: false)
				cell?.setSelected(false, animated: false)
            case 1:
				performSegue(withIdentifier: Constants.weekdaysSegueIdentifier, sender: self)
				cell?.setSelected(true, animated: false)
				cell?.setSelected(false, animated: false)
            case 2:
                performSegue(withIdentifier: Constants.soundSegueIdentifier, sender: self)
                cell?.setSelected(true, animated: false)
                cell?.setSelected(false, animated: false)
            default:
                break
            }
        }
        else if indexPath.section == 1 {
            //delete alarm
            alarmModel.alarms.remove(at: segueInfo.curCellIndex)
            performSegue(withIdentifier: Constants.saveSegueIdentifier, sender: self)
        }
            
    }
   
    @IBAction func snoozeSwitchTapped (_ sender: UISwitch) {
        snoozeEnabled = sender.isOn
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constants.saveSegueIdentifier {
            let dist = segue.destination as! MainAlarmViewController
            let cells = dist.tableView.visibleCells
            for cell in cells {
                let sw = cell.accessoryView as! UISwitch
                if sw.tag > segueInfo.curCellIndex
                {
                    sw.tag -= 1
                }
            }
            alarmScheduler.reSchedule()
        }
        else if segue.identifier == Constants.soundSegueIdentifier {
            //TODO
            let dist = segue.destination as! ChooseSound
            dist.mediaID = segueInfo.mediaID
            dist.selectedSound = segueInfo.selectedSound
        }
        else if segue.identifier == Constants.labelSegueIdentifier {
            let dist = segue.destination as! LabelEditViewController
            dist.label = segueInfo.label
        }
        else if segue.identifier == Constants.weekdaysSegueIdentifier {
            let dist = segue.destination as! WeekdaysViewController
            dist.weekdays = segueInfo.repeatWeekdays
        }
    }
    
    @IBAction func unwindFromLabelEditView(_ segue: UIStoryboardSegue) {
        let src = segue.source as! LabelEditViewController
        segueInfo.label = src.label
    }
    
    @IBAction func unwindFromWeekdaysView(_ segue: UIStoryboardSegue) {
        let src = segue.source as! WeekdaysViewController
        segueInfo.repeatWeekdays = src.weekdays
    }
    
    @IBAction func unwindFromMediaView(_ segue: UIStoryboardSegue) {
        let src = segue.source as! ChooseSound
        segueInfo.selectedSound = src.selectedSound
        segueInfo.mediaID = src.mediaID
    }
}
