import UIKit
import MediaPlayer
import AVFoundation


class MediaViewController: UITableViewController, MPMediaPickerControllerDelegate  {
    
    fileprivate let sounds = 18
    var mediaItem: MPMediaItem?
    var mediaLabel: String!
    var mediaID: String!
	var player: AVAudioPlayer?

	
	override func viewDidLoad() {
		Utils.insertGradientIntoTableView(viewController: self, tableView: tableView)
	}
	
    override func viewWillDisappear(_ animated: Bool) {
        performSegue(withIdentifier: Constants.soundUnwindIdentifier, sender: self)
    }
	
	override var prefersStatusBarHidden: Bool {
		return true
	}
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.musicIdentifier)
        if(cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.default, reuseIdentifier: Constants.musicIdentifier)
        }
		
		// Style
		cell!.backgroundColor = UIColor.clear
		cell!.textLabel?.textColor = UIColor.white
		cell!.textLabel?.font = UIFont.GothamProRegular(size: 17.0)
			
		cell!.selectionStyle = .none
//		if indexPath.row == 0 {
//			cell!.textLabel!.text = "Pick a Song"
//		}
		if indexPath.row == 0 {
			cell!.textLabel!.text = "Bell"
		}
		else if indexPath.row == 1 {
			cell!.textLabel!.text = "Chime"
		}
		else if indexPath.row == 2 {
			cell!.textLabel!.text = "Dracula"
		}
		else if indexPath.row == 3 {
			cell!.textLabel!.text = "Electronica"
		}
		else if indexPath.row == 4 {
			cell!.textLabel!.text = "Escape"
		}
		else if indexPath.row == 5 {
			cell!.textLabel!.text = "Funky"
		}
		else if indexPath.row == 6 {
			cell!.textLabel!.text = "Lollypop"
		}
		else if indexPath.row == 7 {
			cell!.textLabel!.text = "Oldie"
		}
		else if indexPath.row == 8 {
			cell!.textLabel!.text = "Party"
		}
		else if indexPath.row == 9 {
			cell!.textLabel!.text = "Ping"
		}
		else if indexPath.row == 10 {
			cell!.textLabel!.text = "Police"
		}
		else if indexPath.row == 11 {
			cell!.textLabel!.text = "Tickle"
		}
		else if indexPath.row == 12 {
			cell!.textLabel!.text = "Transmission"
		}
		else if indexPath.row == 13 {
			cell!.textLabel!.text = "Trumpet"
		}
		else if indexPath.row == 14 {
			cell!.textLabel!.text = "Tugboat"
		}
		else if indexPath.row == 15 {
			cell!.textLabel!.text = "Ring"
		}
		else if indexPath.row == 16 {
			cell!.textLabel!.text = "Space"
		}
		else if indexPath.row == 17 {
			cell!.textLabel!.text = "Wake"
		}
		else {
			cell!.textLabel?.text = ""
		}
		
		if cell!.textLabel!.text == mediaLabel {
			cell!.accessoryType = UITableViewCellAccessoryType.checkmark
		}
		else {
			cell!.accessoryType = UITableViewCellAccessoryType.none
		}
        
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let mediaPicker = MPMediaPickerController(mediaTypes: MPMediaType.anyAudio)
//        mediaPicker.delegate = self
//        mediaPicker.prompt = "Select any song!"
//        mediaPicker.allowsPickingMultipleItems = false
//
//		if indexPath.row == 0 {
//			self.present(mediaPicker, animated: true, completion: nil)
//		}
//        else {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            mediaLabel = cell?.textLabel?.text!
			playSound(soundName: (cell?.textLabel?.text!)!)
            cell?.setSelected(true, animated: true)
            cell?.setSelected(false, animated: true)
            let cells = tableView.visibleCells
            for c in cells {
                let section = tableView.indexPath(for: c)?.section
                if (section == indexPath.section && c != cell) {
                    c.accessoryType = UITableViewCellAccessoryType.none
                }
            }
//        }
    }
	
	
	func playSound(soundName: String) {
		guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
		
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
			try AVAudioSession.sharedInstance().setActive(true)
			
			/* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
			player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
			
			/* iOS 10 and earlier require the following line:
			player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
			
			guard let player = player else { return }
			
			player.play()
			
		} catch let error {
			print(error.localizedDescription)
		}
	}
    
    
    //MPMediaPickerControllerDelegate
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems  mediaItemCollection:MPMediaItemCollection) -> Void {
        if !mediaItemCollection.items.isEmpty {
            let aMediaItem = mediaItemCollection.items[0]
        
            self.mediaItem = aMediaItem
            mediaID = (self.mediaItem?.value(forProperty: MPMediaItemPropertyPersistentID)) as! String
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
