//
//  PinchViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/23/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var wedImageView: UIImageView!

    @IBAction func picPinchGesture(sender: UIPinchGestureRecognizer) {
        println("pinched \(sender.scale)")
        //scrollViewDidZoom(scrollView)
        wedImageView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
    }
    
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        // any zoom scale changes
        //var scale = scrollView.scale
        var imageViewToZoom: UIView = viewForZoomingInScrollView(self.scrollView)
        
//        println("zoom \(imageViewToZoom)" )
//        println("scale \(imageViewToZoom.frame.size)")
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return wedImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

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
