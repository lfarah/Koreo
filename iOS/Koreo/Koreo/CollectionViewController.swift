//
//  ViewController.swift
//  collectionView
//
//  Created by Eric Galindo on 5/6/16.
//  Copyright © 2016 Eric Galindo. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	@IBOutlet weak var collectionView: UICollectionView!

	let areaNames = ["english", "language", "science", "math", "history"]
  

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return self.areaNames.count
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell

    let area = areaNames[indexPath.row]
		cell.imageView?.image = UIImage(named: area)
		cell.titleLabel?.text = area
    cell.titleLabel.backgroundColor = UIColor.lightGrayColor()
    
		return cell
	}

	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

		selectedIndex = indexPath.row
		self.performSegueWithIdentifier("showImage", sender: self)
	}

	var selectedIndex = 0
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

		let vc = segue.destinationViewController as! MathViewController

		vc.title = areaNames[selectedIndex]
    vc.area = areaNames[selectedIndex]
	}

}
