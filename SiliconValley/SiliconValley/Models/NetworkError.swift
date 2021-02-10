//
//  NetworkError.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 09/02/2021.
//

import Foundation

//
// MARK: - Network Error
//
enum NetworkError: Error {
	//
	// MARK: - Cases
	//
	case invalidPath
	case parseError
	case requestError
}
