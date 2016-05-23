//
//  ClassDetailViewController.swift
//  Koreo
//
//  Created by Lucas Farah on 5/22/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//

import UIKit

class ClassDetailViewController: UIViewController {

	var classname = ""
	var classPicture = UIImage()
	var classDescription = ""
	var classTeacher = ""
	var classiIsRequired = false
	var classArea = ""
	var classBlock = ""
	var classType = ""

	@IBOutlet weak var imgvArea: UIImageView!

	@IBOutlet weak var lblBlock: UILabel!
	@IBOutlet weak var lblTeacherName: UILabel!

	@IBOutlet weak var lblDescription: UITextView!
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.title = classname

		self.lblTeacherName.text = classTeacher
		self.lblBlock.text = classBlock
		self.lblDescription.text = classDescription
		print(classArea)
		self.imgvArea.image = UIImage(named: classArea.lowercaseString)

		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: #selector(addTapped))

	}

	func addTapped() {

		if var arr = NSUserDefaults.standardUserDefaults().arrayForKey(classType) as? [[String: AnyObject]] {

			let classDic = ["name": classname, "description": classDescription, "block": classBlock, "area": classArea, "teacher": classTeacher]

			arr.append(classDic)

			NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "required")

		} else {

			let classDic = ["name": classname, "description": classDescription, "block": classBlock, "area": classArea, "teacher": classTeacher]

			let arr = [classDic]

			NSUserDefaults.standardUserDefaults().setObject(arr, forKey: classType)
		}

    print(classType)
		NSUserDefaults.standardUserDefaults().synchronize()
		self.navigationController?.popToRootViewControllerAnimated(true)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
