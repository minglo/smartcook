//
//  SCAutoMenuViewController.swift
//  Smart Cook
//
//  Created by Ming Lo on 15/5/30.
//  Copyright (c) 2015年 ashleywu-minglo. All rights reserved.
//

import UIKit

class SCAutoMenuViewController: UITableViewController {

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let imageNames = ["SCHotPhoto", "SCShrimpPhoto", "SCTomPhoto"]
        let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCellView") as! UITableViewCell
        let imageView = cell.viewWithTag(100) as! UIImageView
        imageView.image = UIImage(named: imageNames[indexPath.row])
        
        return cell
    }
}
