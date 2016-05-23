//
//  ClassManager.swift
//  Koreo
//
//  Created by Lucas Farah on 5/23/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//
//swiftlint:disable force_cast
//swiftlint:disable trailing_whitespace
//swiftlint:disable line_length

import UIKit
import Alamofire

class ClassManager: AnyObject {

	var classes: [ClassModel] = []

  func downloadFromServer(area: String, handler: () -> ()) {

		Alamofire.request(.GET, "http://0.0.0.0:8080/returnsubject/\(area)", parameters: [:])
			.responseJSON { response in

				print(response)
				if let JSON = response.result.value {
          
          for dicClass in JSON as! [[String: AnyObject]] {
            
            let model = ClassModel(area: dicClass["area"] as! String, name: dicClass["name"] as! String, block: dicClass["block"] as! String, teacher: dicClass["teacher"] as! String, description: dicClass["description"] as! String)
            
            self.classes.append(model)
          }
          handler()
				}
		}

	}

}
