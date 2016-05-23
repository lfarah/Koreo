//
//  ViewController.swift
//  Koreo
//
//  Created by Lukas Kasimor on 5/5/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//
//swiftlint:disable line_length

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var table: UITableView!

	@IBOutlet weak var butRequired: UIButton!

	@IBOutlet weak var butAll: UIButton!

	@IBOutlet weak var butElectives: UIButton!

//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }

	@IBAction func allClasses(sender: AnyObject) {

		self.butElectives.enabled = true
		self.butRequired.enabled = true
		self.butAll.enabled = false

		tableArray = []
		for elective in electivesArray {
			tableArray.append(elective)
		}
		for required in requiredArray {
			tableArray.append(required)
		}
		table.reloadData()
//        let classes = [requiredArray, electivesArray]
//        let sortedClasses = classes.sort { $0.name < $1.name }
//        print(sortedClasses)

	}

	@IBAction func requiredClasses(sender: AnyObject) {

		self.butElectives.enabled = true
		self.butRequired.enabled = false
		self.butAll.enabled = true

		tableArray = []
		tableArray = requiredArray
		table.reloadData()
	}

	@IBAction func electiveClasses(sender: AnyObject) {
		self.butElectives.enabled = false
		self.butRequired.enabled = true
		self.butAll.enabled = true

		tableArray = []
		tableArray = electivesArray
		table.reloadData()
	}

	var requiredArray: [[String: AnyObject]] = []

	var electivesArray: [[String: AnyObject]] = []

	var tableArray: [[String: AnyObject]] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let col1 = UIColor(red: 0 / 255, green: 184 / 255, blue: 169 / 255, alpha: 1)
		navigationController?.navigationBar.barTintColor = col1
		navigationController?.navigationBar.tintColor = UIColor.whiteColor()
		navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

	}

	override func viewWillAppear(animated: Bool) {

		if let arrRequired = NSUserDefaults.standardUserDefaults().arrayForKey("required") as? [[String: AnyObject]] {

			self.requiredArray = arrRequired
			table.reloadData()
		} else {

		}

		if let arrElective = NSUserDefaults.standardUserDefaults().arrayForKey("elective") as? [[String: AnyObject]] {

			self.electivesArray = arrElective
			table.reloadData()

		} else {

		}

		allClasses(self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		var cell = tableView.dequeueReusableCellWithIdentifier("cell")

		if cell == nil {
			cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
		}

		let dic = tableArray[indexPath.row]
		cell?.textLabel?.text = dic["name"] as? String

		if let block = dic["block"] as? String {
			cell?.detailTextLabel?.text = "Block \(block)"
		}
		return cell!
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableArray.count
	}

}
