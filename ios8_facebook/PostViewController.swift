//
//  PostViewController.swift
//  ios8_facebook
//
//  Created by Stanley Ng on 9/5/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        println("PostViewController - viewDidLoad")
        
        // config content view
        contentImageView.sizeToFit()
        
        // config scroll view
        scrollView.contentSize = CGSize(width: contentImageView.frame.width, height: contentImageView.frame.height + 56)
        
        // config like button
        likeButton.frame.origin.x = 18
        likeButton.frame.origin.y = 358
        
        // config comment bar image view
        commentView.frame.origin.y = view.frame.height - 48 - commentView.frame.height;

        // config text field
        //textField.becomeFirstResponder()
        
        // config keyboard show / hide observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willShowKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willHideKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willShowKeyboard(notification: NSNotification) {

        println("PostViewController - willShowKeyboard")

        var userInfo: NSDictionary = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize: CGSize = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue().size
        println("height: \(kbSize.height), width: \(kbSize.width)")

        // reposition the comment view
        commentView.frame.origin.y = kbSize.height + 20
    }

    func willHideKeyboard(notification: NSNotification) {
        
        println("PostViewController - willHideKeyboard")

        // reposition the comment view
        commentView.frame.origin.y = view.frame.height - 48 - commentView.frame.height;
    }

    @IBAction func onBack(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onLike(sender: UIButton) {
        likeButton.selected = !likeButton.selected
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        println("PostViewController - onTap")
        
        textField.resignFirstResponder()
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
