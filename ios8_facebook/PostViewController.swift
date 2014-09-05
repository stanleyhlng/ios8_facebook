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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func onLike(sender: UIButton) {
        likeButton.selected = !likeButton.selected
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
