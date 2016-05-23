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
	var classBlock = 0
  
  @IBOutlet weak var imgvArea: UIImageView!
  
  @IBOutlet weak var lblBlock: UILabel!
  @IBOutlet weak var lblTeacherName: UILabel!

  @IBOutlet weak var lblDescription: UITextView!
	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
