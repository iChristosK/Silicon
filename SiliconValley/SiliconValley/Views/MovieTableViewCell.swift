//
//  MovieTableViewCell.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 30/01/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

	@IBOutlet weak var labelEpisodeName: UILabel!
	@IBOutlet weak var labelEpisodeNumber: UILabel!
	@IBOutlet weak var labelSeasonNumber: UILabel!
	@IBOutlet weak var imagePoster: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	
	func prepare(episode:Episode){

		
		imagePoster.downloaded(from:episode.poster)
		imagePoster.layer.cornerRadius = 12;
		labelEpisodeName.text = episode.title
		labelEpisodeNumber.text = "Episode \(episode.episode)"
		labelSeasonNumber.text = "Season \(episode.season)"
		
		
	}

}


// Extension to download image from URL, asynchronously

// MARK: Better approach
/* a better approach would have been to add this extension inside the model, usually methods that extend capabilities of
 of UIImageView could be considered part of model, could have created a Network model for all the requests
.Additionally in real life apps I wouldn't do this, there are better libraries that could handle this (Kindfihser!!!) */
extension UIImageView {
	func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
			else { return }
			DispatchQueue.main.async() { [weak self] in
				self?.image = image
			}
		}.resume()
	}
	func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
		guard let url = URL(string: link) else { return }
		downloaded(from: url, contentMode: mode)
	}
}

