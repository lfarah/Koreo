//
//  ViewController.swift
//  collectionView
//
//  Created by Eric Galindo on 5/6/16.
//  Copyright © 2016 Eric Galindo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let appleProducts = ["iPhone", "Apple Watch", "Mac", "iPad"]
    
    var imageArray: [UIImage] = [UIImage(named: "024c0be191db68d89b4446b63a50e9d7.jpg")!, UIImage(named: "photo.jpg")!,UIImage(named: "WvKTIeeC.jpg")!]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.imageArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        cell.titleLabel?.text = self.appleProducts[indexPath.row]
        
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showImage" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! NewViewController
            
            vc.title = self.appleProducts[indexPath.row]
            vc.image = self.imageArray[indexPath.row]
        }
        
    }

}
