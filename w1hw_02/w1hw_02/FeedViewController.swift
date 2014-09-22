//
//  FeedViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/5/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBAction func tapBride(tapBride: UITapGestureRecognizer) {
        handleTapPhoto(tapBride)
    }
    
    @IBAction func tapWedWall(sender: UITapGestureRecognizer) {
        handleTapPhoto(sender)
    }
    
    @IBAction func tapWedPath(sender: UITapGestureRecognizer) {
        handleTapPhoto(sender)
    }
    
    @IBAction func tapWedToss(sender: UITapGestureRecognizer) {
        handleTapPhoto(sender)
    }
    
    @IBAction func tapWedTable(sender: UITapGestureRecognizer) {
        handleTapPhoto(sender)
    }
    
    var imageViewToPass: UIImageView! // diff image for tap on each img
    
    func handleTapPhoto (pic: UITapGestureRecognizer) {
        var photo = pic.view as UIImageView // pic.view is how we get a handle to the thing the gestureRecognizer is attached to
        
        println("got gesture \(photo.image)")
        imageViewToPass = photo
        
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        destinationViewController.passedInImage = self.imageViewToPass.image
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSizeMake(320, 1074)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
