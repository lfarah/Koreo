//
//  ViewController.swift
//  Koreo
//
//  Created by Lukas Kasimor on 5/5/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    @IBAction func allClasses(sender: AnyObject) {

        tableArray = []
        for elective in electivesArray {
            tableArray.append(elective)
        }
        for required in requiredArray {
            tableArray.append(required)
        }
        table.reloadData()
        let classes = [requiredArray, electivesArray]
        let sortedClasses = classes.sort { $0.name < $1.name }
        print(sortedClasses)

    }
    @IBAction func requiredClasses(sender: AnyObject) {
        tableArray = []
        tableArray = requiredArray
        table.reloadData()
    }
    
    @IBAction func electiveClasses(sender: AnyObject) {
        tableArray = []
        tableArray = electivesArray
        table.reloadData()
    }
    
    
    
    let requiredArray = ["Algebra I", "Advanced Algebra", "Geometry Functions", "Intro to Lit", "Intro to Comp", "American Literature", "World Literature", "Biology", "Physics", "Chemistry", "Conceptual Physics", "European History", "World History", "United States History", "Modern American Social History", "Spanish I", "Spanish II", "Mandarin I", "Mandarin II"]
    
    let electivesArray = ["Jazz Band", "Concert Band", "Graphic Design", "Computer Programming", "Art I & II", "Art III & IV", "Theatre Arts", "Economics"]

    var tableArray: [String] = []
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let col1 = UIColor(red: 0/255, green: 184/255, blue: 169/255, alpha: 1) 
        navigationController?.navigationBar.barTintColor = col1
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
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
        cell?.textLabel?.text = tableArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }


}

