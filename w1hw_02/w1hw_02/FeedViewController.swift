//
//  FeedViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/5/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!

    
    @IBAction func tapBride(sender: UITapGestureRecognizer) {
        handleTapPhoto(sender)
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
    
    var isPresenting: Bool = true // not BOOL as in snippet
    //var imageViewToPass: UIImageView! // diff image for tap on each img

    var tempPhoto: UIImageView!
    var photo: UIImageView!
    var scrollOffset: CGFloat = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSizeMake(320, 1074)
    }

    
    func handleTapPhoto (pic: UITapGestureRecognizer) {
        photo = pic.view as UIImageView // pic.view is how we get a handle to the thing the gestureRecognizer is attached to
        var window = UIApplication.sharedApplication().keyWindow
        tempPhoto = UIImageView(frame: CGRect(
            x: photo.frame.origin.x,
            y: photo.frame.origin.y + self.scrollView.frame.origin.y - scrollOffset,
            width: photo.frame.width,
            height: photo.frame.height))
        
        tempPhoto.image = photo.image
        window.addSubview(tempPhoto)
        photo.hidden = true
        
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollOffset = scrollView.contentOffset.y
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 1
    }
    
    
    var toad: UIImageView!
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            
            var photoVC = toViewController as PhotoViewController
            photoVC.bigImgView.hidden = true
            photoVC.bigImgView.image = photo.image // put tapped image in PhotoViewController
            toViewController.view.alpha = 0
            photo.hidden = true

            
            UIView.animateWithDuration(1, animations: { () -> Void in
                toViewController.view.alpha = 1
                self.tempPhoto.frame = CGRect(
                    x: photoVC.scrollView.frame.origin.x,
                    y: photoVC.scrollView.frame.origin.y,
                    width: 320,
                    height: photoVC.bigImgView.frame.height
                )
                self.tempPhoto.contentMode = UIViewContentMode.ScaleAspectFill;
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                photoVC.bigImgView.hidden = false
                self.tempPhoto.hidden = true
            }

        } else {

            var photoVC = fromViewController as PhotoViewController
            
            // compensate for scrolled bigImgView in photoVC
            self.tempPhoto.frame.origin.y = photoVC.scrollView.frame.origin.y - photoVC.scrollView.contentOffset.y
            self.tempPhoto.hidden = false
            photoVC.bigImgView.hidden = true
            fromViewController.view.backgroundColor = UIColor(white: 0, alpha: 1) // ask why this is needed?
            

            UIView.animateWithDuration(1, animations: { () -> Void in
                self.tempPhoto.frame = self.photo.frame
                self.tempPhoto.frame.origin.y = self.photo.frame.origin.y + self.scrollView.frame.origin.y - self.scrollOffset
                fromViewController.view.alpha = 0
                
                
                
            }) { (finished: Bool) -> Void in
                self.photo.hidden = false
                self.tempPhoto.removeFromSuperview()
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
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
