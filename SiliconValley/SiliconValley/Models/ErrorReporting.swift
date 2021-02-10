//
//  ErrorReporting.swift
//  SiliconValley
//
//  Created by Christos Katomoniatis on 10/02/2021.
//

import Foundation
import UIKit

class ErrorReporting {
	static func showMessage(title: String, message: String, `on` controller: UIViewController) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
		
		controller.present(alert, animated: true, completion: nil)
	}
}
