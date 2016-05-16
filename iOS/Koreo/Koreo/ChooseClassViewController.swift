//
//  ChooseClassViewController.swift
//  Koreo
//
//  Created by Lukas Kasimor on 5/13/16.
//  Copyright © 2016 Lukas Kasimor. All rights reserved.
//

import UIKit

class ChooseClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Group.png")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
