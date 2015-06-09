//
//  SCTouchControlViewController.swift
//  Smart Cook
//
//  Created by Ming Lo on 15/6/8.
//  Copyright (c) 2015年 ashleywu-minglo. All rights reserved.
//

import UIKit

class SCTouchControlViewController: UIViewController {
    var hourLength = 24
    var minuteLength = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 设置个数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 设置行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return hourLength
        }
        if(component == 1){
            return minuteLength
        }
        return 0
    }
    
    // 设置每行具体内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(component == 0){
            return "\(row)"
        }
        if(component == 1){
            return "\(row)"
        }
        return nil
    }
    
}
