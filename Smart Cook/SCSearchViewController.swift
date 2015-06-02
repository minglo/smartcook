//
//  SCSearchViewController.swift
//  Smart Cook
//
//  Created by Ming Lo on 15/5/30.
//  Copyright (c) 2015年 ashleywu-minglo. All rights reserved.
//

import UIKit

protocol SCSearchViewControllerDelegate {
    func didTriggerSearchAgainButton()
    func didSelectCookWare()
}

class SCSearchItemCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
//    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var imgView: UIImageView!
}

class SCSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var icons: [String] = []
    var items: [String] = []
    var ids: [String] = []
    var delegate: SCSearchViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: 如何做成这种形式
        /*
        [{
            icon: "SCIconInductioncooker",
            name: "Induction Cooker",
            id: "05#4032"
        },{
            icon: "SCIconInductioncooker",
            name: "Induction Cooker",
            id: "05#4032"
        }]
        */
        icons.extend(["SCIconInductioncooker", "SCIconStockpot", "SCIconFryingpan", "SCIconDutchoven"])
        items.extend(["Induction Cooker", "STOCKPOT", "DUTCH OVEN", "FRYING PAN"])
        ids.extend(["05#4032", "03#3138", "06#1285", "07#6130"])

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as! SCSearchItemCell
        cell.imgView.image = UIImage(named: icons[indexPath.row])
        cell.label.text = items[indexPath.row]
//        cell.id.text = ids[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectCookWare()
    }
    
    @IBAction func didTriggerSearchAgainButton(sender: AnyObject?) {
        delegate?.didTriggerSearchAgainButton()
    }
}
