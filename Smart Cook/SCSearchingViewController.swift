//
//  SCSearchingViewController.swift
//  Smart Cook
//
//  Created by Ming Lo on 15/5/30.
//  Copyright (c) 2015年 ashleywu-minglo. All rights reserved.
//

import UIKit

class SCSearchingViewController: UIViewController, SCSearchViewControllerDelegate {
    
    var prepareSeuge: ((viewController:UIViewController)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        showSearchViewControllerAfterSomeTime()
    }
    
    func showSearchViewControllerAfterSomeTime() {
        let delay = dispatch_time(DISPATCH_TIME_NOW, (Int64)(3 * NSEC_PER_SEC))
        dispatch_after(delay, dispatch_get_main_queue()) {
            self.prepareSeuge = {
                vc in
                
                let viewController = vc as! SCSearchViewController
                viewController.delegate = self
            }
            self.performSegueWithIdentifier("segueSearchViewController", sender: nil)
        }
    }
    
    func showCookWareViewController() {
        self.prepareSeuge = {
            vc in
            
            (vc as! SCSplashViewController).delegate = {
                self.dismissViewControllerAnimated(false, completion: nil)
                self.showMainViewController()
            }
        }
        self.performSegueWithIdentifier("segueSplashViewController", sender: nil)
    }
    
    func showMainViewController() {
        self.prepareSeuge = nil
        self.performSegueWithIdentifier("segueMainViewController", sender: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: animations
    }
    
    func didTriggerSearchAgainButton() {
        self.dismissViewControllerAnimated(false, completion: nil)
        showSearchViewControllerAfterSomeTime()
    }
    
    func didSelectCookWare() {
        self.dismissViewControllerAnimated(false, completion: nil)
        showCookWareViewController()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        prepareSeuge?(viewController: segue.destinationViewController as! UIViewController)
    }
}
