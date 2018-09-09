import UIKit
import SwiftySound


class ChooseSound: UITableViewController {
	
	var mediaID: String!
	var selectedSound: String!
	var sounds = ["Bell", "Chime", "Dracula", "Electronica", "Escape", "Funky", "Lollypop", "Oldie", "Party", "Ping", "Police", "Tickle", "Transmission", "Trumpet", "Tugboat", "Ring", "Space", "Wake"]
	
	
	
	/* MARK: Initialising
	/////////////////////////////////////////// */
	override func viewDidLoad() {
		Utils.insertGradientIntoTableView(viewController: self, tableView: tableView)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		Sound.stopAll()
		performSegue(withIdentifier: Constants.soundUnwindIdentifier, sender: self)
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
		
		cell!.textLabel!.text = sounds[indexPath.row]
		
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
		selectedSound = cell?.textLabel?.text!
		
		// Music
		Sound.stopAll()
		Sound.play(file: sounds[indexPath.row], fileExtension: "mp3", numberOfLoops: -1)
		
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
