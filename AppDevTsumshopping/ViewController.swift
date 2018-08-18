//
//  ViewController.swift
//  AppDevTsumshopping
//
//  Created by Selena on 2018/8/18.
//  Copyright © 2018年 Selena. All rights reserved.
//

import UIKit

var goal: Date!
var now: Date!

class ViewController: UIViewController {
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var nowTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    
    override func viewDidLoad() {
        myDatePicker.minimumDate = Date() //防止時間變成負數
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func myDatePickerAction(_ sender: UIDatePicker) {
        goal = sender.date // myDatePicker選擇的日子
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd" // 顯示在 text field 的時間日期格式
        let time = formatter.string(from: now)
        self.nowTextField.text = time
        let interval = goal.timeIntervalSince(now) //目標日跟現在時間的差
        goalTextField.text = formatter.string(from: myDatePicker.date) //更新 text field 內容
        let integerinterval = Int(interval/60/60/24+1) //讓天數正常增加
        intervalTextField.text = ("\(integerinterval)")
        print(integerinterval) //輸出計算結果
    }

}
