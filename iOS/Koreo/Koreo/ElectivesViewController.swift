//
//  NewViewController.swift
//  collectionView
//
//  Created by Eric Galindo on 5/6/16.
//  Copyright © 2016 Eric Galindo. All rights reserved.
//
//swiftlint:disable line_length
//swiftlint:disable trailing_whitespace
//swiftlint:disable force_cast

import UIKit
import Alamofire

class ElectivesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var mathTable: UITableView!
  
  var classes: [[String: AnyObject]] = []
  var area = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //        self.imageView.image = UIImage(named: "math.jpg")!
    
    // Do any additional setup after loading the view.
    //		print(area)
    //		print(classes)
    downloadFromServer(area)
  }
  
  func downloadFromServer(area: String) {
    
    Alamofire.request(.GET, "http://0.0.0.0:8080/returnelectives", parameters: [:])
      .responseJSON { response in
        
        print(response)
        if let JSON = response.result.value {
          self.classes = JSON as! [[String: AnyObject]]
          self.mathTable.reloadData()
        }
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CellTableViewCell!
   
    if !(cell != nil) {
      cell = CellTableViewCell(style: .Default, reuseIdentifier: "cell")
    }
    
    let classDic = classes[indexPath.row]
    print("0")
    print(classDic["name"])
    print("1")
    
    if let name = classDic["name"] as? String, teacher = classDic["teacher"] as? String, block = classDic["block"] as? String {
      
      cell?.lblClassName.text = name
      cell.lblTeacherName.text = teacher
      cell.lblClassBlock.text = block
    }
    return cell!
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return classes.count
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    selectedIndex = indexPath.row
    self.performSegueWithIdentifier("detail", sender: "elective")
  }
  
  var selectedIndex = 0
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let vc = segue.destinationViewController as! ClassDetailViewController
    
    let classDic = classes[selectedIndex]
    if let name = classDic["name"] as? String, teacher = classDic["teacher"] as? String, block = classDic["block"] as? String, area = classDic["area"] as? String, classDescription = classDic["description"] as? String {
      
      vc.classArea = area
      vc.classname = name
      vc.classBlock = block
      vc.classTeacher = teacher
      vc.classDescription = classDescription
      vc.classType = sender as! String
    }
    //		vc.classname = classes[selectedIndex]["name"]!
    //		vc.classBlock = classes[selectedIndex]["block"]!
    
  }
  
}
