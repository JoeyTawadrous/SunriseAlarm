//
//  TodayViewController.swift
//  Sunrise Alarm
//
//  Created by Kaushik Gadhiya on 04/05/19.
//  Copyright © 2019 LongGames. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var alarms = [Alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.filterTodayAlarms()
        if alarms.count > 2
        {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        }
        else
        {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .compact
        }
        
    }
    func filterTodayAlarms()
    {
        let alarmModel = Alarms()
        alarms.removeAll()
        for alarm in alarmModel.alarms
        {
            if alarm.repeatWeekdays.contains(self.getDayOfWeek()!) && alarm.enabled
            {
                alarms.append(alarm)
            }
        }
        
        tableView.reloadData()
    }
    func getDayOfWeek() -> Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: Date())
        return weekDay
    }
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize)
    {
        if activeDisplayMode == .expanded
        {
            preferredContentSize = self.tableView.contentSize
        }
        else
        {
            preferredContentSize = maxSize
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if alarms.count == 0 {
            return 90
        }
        else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if alarms.count == 0 {
            return 1
        }
        else {
            return alarms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if alarms.count == 0
        {
            var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "noCell")
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "noCell")
            }
            return cell
        }
        else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: Constants.alarmCellIdentifier)
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: Constants.alarmCellIdentifier)
            }
            
            // Style
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.textColor = UIColor.white
            cell!.detailTextLabel?.textColor = UIColor.white
            cell!.detailTextLabel?.font = UIFont.GothamProRegular(size: 16.0)
            cell?.selectionStyle = .none
            
            // text
            cell!.tag = indexPath.row
            let alarm: Alarm = alarms[indexPath.row]
            
            let amAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.GothamProMedium(size: 18.0)!]
            let str = NSMutableAttributedString(string: alarm.formattedTime, attributes: amAttr)
            
            let timeAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.GothamProMedium(size: 25.0)!]
            str.addAttributes(timeAttr, range: NSMakeRange(0, str.length-5))
            
            cell!.textLabel?.attributedText = str
            
            cell!.detailTextLabel?.text = alarm.label + ", " + WeekdaysViewController.repeatText(weekdays: alarm.repeatWeekdays)
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: "SunriseAlarmLocalHost://")
        {
            self.extensionContext?.open(url, completionHandler: {success in print("called url complete handler: \(success)")})
        }
    }
}
