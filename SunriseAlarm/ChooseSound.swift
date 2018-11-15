import UIKit
import SwiftySound
import AudioToolbox
import AVFoundation


class ChooseSound: UITableViewController {
	
	var mediaID: String!
	var selectedSound: String!
	var sounds = [["Bell", false], ["Chime", false], ["Escape", false], ["Oldie", false], ["Ping", false], ["Police", false], ["Tickle", false], ["Dracula", true], ["Electronica", true], ["Funky", true], ["Lollypop", true], ["Party", true], ["Transmission", true], ["Trumpet", true], ["Tugboat", true], ["Ring", true], ["Space", true], ["Wake", true]]
	
	
	
	/* MARK: Initialising
	/////////////////////////////////////////// */
	override func viewDidLoad() {
		Utils.insertGradientIntoTableView(viewController: self, tableView: tableView)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		Sound.stopAll()
		if !Utils.bool(key: Constants.Defaults.INTENT_TO_PURCHASE) {
			performSegue(withIdentifier: Constants.soundUnwindIdentifier, sender: self)
		}
	}
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
	
	
	/* MARK: Table
	/////////////////////////////////////////// */
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sounds.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
		if(cell == nil) { cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell") }
		
		cell!.textLabel!.text = sounds[indexPath.row][0] as? String
		
		// Style
		cell!.backgroundColor = UIColor.clear
		cell!.textLabel?.font = UIFont.GothamProRegular(size: 16.0)
		cell!.textLabel?.textColor = UIColor.white
		cell!.tintColor = UIColor.white
		cell!.selectionStyle = .none
		
		// Add tick
		cell!.accessoryType = UITableViewCellAccessoryType.none
		if cell!.textLabel!.text == selectedSound {
			cell!.accessoryType = UITableViewCellAccessoryType.checkmark
		}
		
		return cell!
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath)
		
		if (sounds[indexPath.row][1] as? Bool)! && !Purchase.hasUpgraded() { // Premium sound
			Sound.stopAll()
			Utils.set(key: Constants.Defaults.INTENT_TO_PURCHASE, value: true)
			Utils.presentView(self, viewName: Constants.Views.UPGRADE)
		}
		else {
			selectedSound = cell?.textLabel?.text!
			
			do {
				try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, with: [.duckOthers, .defaultToSpeaker])
				try AVAudioSession.sharedInstance().setActive(true)
				UIApplication.shared.beginReceivingRemoteControlEvents()
			} catch {
				NSLog("Audio Session error: \(error)")
			}
			
			// Music
			Sound.stopAll()
			Sound.play(file: (sounds[indexPath.row][0] as? String)!, fileExtension: "mp3", numberOfLoops: -1)
			
			// Add tick
			cell?.accessoryType = UITableViewCellAccessoryType.checkmark
			
			// Remove tick
			let cells = tableView.visibleCells
			for c in cells {
				let section = tableView.indexPath(for: c)?.section
				if (section == indexPath.section && c != cell) {
					c.accessoryType = UITableViewCellAccessoryType.none
				}
			}
		}
	}
}
