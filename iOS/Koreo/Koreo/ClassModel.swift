//
//  ClassModel.swift
//  Koreo
//
//  Created by Lucas Farah on 5/23/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//
//swiftlint:disable function_parameter_count
//swiftlint:disable line_length

import UIKit

class ClassModel: AnyObject {

	var classArea = ""
	var classname = ""
	var classBlock = ""
	var classTeacher = ""
	var classDescription = ""
	var classType = ""

	init(area: String, name: String, block: String, teacher: String, description: String) {

		self.classArea = area
		self.classname = name
		self.classBlock = block
		self.classTeacher = teacher
		self.classDescription = description

	}

}
