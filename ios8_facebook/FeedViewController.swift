//
//  FeedViewController.swift
//  ios8_facebook
//
//  Created by Stanley Ng on 9/4/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        println("FeedViewController - viewDidLoad")
        
        // config content view
        contentImageView.sizeToFit()
        
        // config scroll view
        scrollView.contentSize = CGSize(width: contentImageView.frame.width, height: contentImageView.frame.height + 56)
        
        // config post button
        postButton.frame.origin.y = 228
        
        // config comment button
        commentButton.frame.origin.x = 110
        commentButton.frame.origin.y = 596
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        /*
        if (sender is UIButton) {
            println("DEBUG UIBUTTON")
            println((sender as UIButton).tag)
        }
        else {
            println("DEBUG NOT UIBUTTON")
        }

        if (segue.destinationViewController is PostViewController) {
            println("YES")
        }
        else {
            println("NO")
        }
        */

        if (sender is UIButton) {
         
            if (segue.destinationViewController is PostViewController) {

                var destinationViewController = segue.destinationViewController as PostViewController

                switch ((sender as UIButton).tag) {
                case 2:
                    destinationViewController.autoSelected = true
                    break
                default:
                    println("")
                }
                
            }
            
        }
    }

    @IBAction func onComment(sender: UIButton) {
        
        println("FeedViewController - onComment")

        performSegueWithIdentifier("postFromFeedSegue", sender: sender)
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
