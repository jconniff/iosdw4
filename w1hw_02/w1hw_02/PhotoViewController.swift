//
//  PhotoViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/22/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bigImgView: UIImageView!
    @IBOutlet weak var doneBtnImageView: UIImageView!
    @IBOutlet weak var actionBtnsImageView: UIImageView!
    
    @IBAction func doneBtnTouchUP(sender: AnyObject) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func pinchScrollView(sender: UIPinchGestureRecognizer) {
        bigImgView.transform = CGAffineTransformMakeScale(sender.scale, sender.scale)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 2000)
        scrollView.delegate = self
        //scrollView.backgroundColor = UIColor(red: 1, green: 0.3, blue: 0.8, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        var off = scrollView.contentOffset
        println("off.y: \(off.y) bigImgView.frame.origin.y \(bigImgView.frame.origin.y)")
        
        if (off.y < 0) {
            var pct = (50 - abs(off.y)) / 50
            //println("pct: \(pct)")
            doneBtnImageView.alpha = pct
            actionBtnsImageView.alpha = pct
            self.view.backgroundColor = UIColor(white: 0, alpha: pct)
        }
        
        
        if (off.y < -50) {
            dismissViewControllerAnimated(true, completion: nil)
        }
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
