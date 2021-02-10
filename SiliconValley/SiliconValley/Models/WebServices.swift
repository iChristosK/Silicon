//
//  WebServices.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 09/02/2021.
//

import Foundation

class WebServices {
	//
	// MARK: - Class Methods
	//
	static func loadData(completionHandler: @escaping (SiliconValley?, Bool?) -> Void) {

		Network.loadJSONFile(named: "hbo-silicon-valley", type: SiliconValley.self) { (silicon, error) in
				guard error == nil else {
					completionHandler(nil, false)
					return
				}
				completionHandler(silicon, true)
		}
	}
}
