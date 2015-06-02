//
//  SCCookViewController.swift
//  Smart Cook
//
//  Created by Ming Lo on 15/5/30.
//  Copyright (c) 2015年 ashleywu-minglo. All rights reserved.
//

import UIKit

class SCCookViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var autoMenuVC: UIViewController!
    var touchMenuVC: UIViewController!
    @IBOutlet var menuSegmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        autoMenuVC = self.storyboard!.instantiateViewControllerWithIdentifier("autoMenuViewController") as! UIViewController
        touchMenuVC = self.storyboard!.instantiateViewControllerWithIdentifier("touchMenuViewController") as! UIViewController
        
        self.setViewControllers([autoMenuVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true) { _ in }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController == autoMenuVC {
            return touchMenuVC
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController == touchMenuVC {
            return autoMenuVC
        } else {
            return nil
        }
    }
    
    @IBAction func menuSegmentDidChange(sender: AnyObject?) {
        let AUTO = 0
        if menuSegmentControl.selectedSegmentIndex == AUTO {
            self.setViewControllers([autoMenuVC], direction: UIPageViewControllerNavigationDirection.Reverse, animated: false) { _ in }
        } else {
            self.setViewControllers([touchMenuVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: false) { _ in }
        }
    }
}
