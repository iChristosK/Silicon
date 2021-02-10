
//
//  Movie.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 30/01/2021.
//

import Foundation

// MARK: - SiliconValley
struct SiliconValley: Codable {
	let seasons: [Season]
	let title: String
}

// MARK: - Season
struct Season: Codable {
	let episodes: [Episode]
}

// MARK: - Episode
struct Episode: Codable {
	let plot: String
	let title: String
	let season: String
	let poster: String
	let episode: String
	let year: String

	enum CodingKeys: String, CodingKey {
		case plot = "Plot"
		case title = "Title"
		case season = "Season"
		case poster = "Poster"
		case episode = "Episode"
		case year = "Year"
	}
}

enum MyError: Error {
	case FoundNil(String)
}

