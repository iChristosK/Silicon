//
//  MovieDetailedViewController.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 30/01/2021.
//

import UIKit

class MovieDetailedViewController: UIViewController {

	@IBOutlet weak var image: UIImageView!
	@IBOutlet weak var labelEpisodeTitle: UILabel!
	@IBOutlet weak var labelEpisodeNumber: UILabel!
	@IBOutlet weak var labelSeasonNumber: UILabel!
	@IBOutlet weak var labelPlot: UILabel!
	
	var episode:Episode!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		image.downloaded(from:episode.poster)
		image.layer.cornerRadius = 12;
		labelEpisodeTitle.text = episode.title
		labelEpisodeNumber.text = "Episode \(episode.episode)"
		labelSeasonNumber.text = "Season \(episode.season)"
		labelPlot.text = episode.plot
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
