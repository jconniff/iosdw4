//
//  ThrillistDetailViewController.swift
//  w1hw_02
//
//  Created by Jeff Conniff on 9/5/14.
//  Copyright (c) 2014 jconniff. All rights reserved.
//

import UIKit

class ThrillistDetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var CommentContainer: UIView!
    @IBOutlet weak var PostBtn: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    
    
    @IBAction func likeButtonTouchUp(sender: AnyObject) {
        likeButton.selected = !likeButton.selected
    }
    @IBAction func backBtnTouchUp(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true);
        
        // As pasted below from guide code snippet (without the "?") throws error
        // navigationController.popViewControllerAnimated(true);
        
    }

    
    
    @IBAction func PostBtnTouchUp(sender: AnyObject) {
        self.myTextField.resignFirstResponder();
    }
   
    
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
 
            self.CommentContainer.frame = CGRectMake(0,
                self.view.frame.size.height - kbSize.height - self.CommentContainer.frame.size.height,
                self.CommentContainer.frame.size.width, self.CommentContainer.frame.size.height);
            
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
 
            self.CommentContainer.frame = CGRectMake(0, 475,
                self.CommentContainer.frame.size.width,
                self.CommentContainer.frame.size.height);
            
            
            }, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSizeMake(320, 1243);
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
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
