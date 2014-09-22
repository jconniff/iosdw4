//
//  PhotoViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/22/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var fullImage: UIImageView!
    @IBAction func btnDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    var passedInImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.image = passedInImage
        // Do any additional setup after loading the view.
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
