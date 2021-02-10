//
//  MovieTableViewController.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 30/01/2021.
//

import UIKit

class MovieTableViewController: UITableViewController {

	var seasons = [Season]()
	var episodes = [Episode]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
	
	
	func loadData(){
		WebServices.loadData { (silicon, success) in
			if success == true {
				guard let silicon = silicon else {
					ErrorReporting.showMessage(title:"Error", message: "Silicon is empty", on: self)
					return}
				self.seasons = silicon.seasons
				for season in self.seasons {
					self.episodes.append(contentsOf: season.episodes)
							}
				self.tableView.reloadData()
			}
			else {
				ErrorReporting.showMessage(title:"Error", message: "Could not load data due to network error", on: self)

			}
		}

	}
	
	


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		return episodes.count
	
    }
	

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

		let row = episodes[indexPath.row]
		cell.prepare(episode: row)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation to Movie Detailed View

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
		
		let detailedViewController = segue.destination as! MovieDetailedViewController
		guard let row = tableView.indexPathForSelectedRow?.row else { return }
		
		let episode = episodes[row]
		detailedViewController.episode = episode
    }
    

}
