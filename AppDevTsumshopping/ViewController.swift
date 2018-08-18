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
    @IBOutlet weak var goalTextField: UITextField! //開幕時間的文字顯示
    @IBOutlet weak var myDatePicker: UIDatePicker! //時間選擇器
    @IBOutlet weak var nowTextField: UITextField! //今天的文字顯示
    @IBOutlet weak var intervalTextField: UITextField!
    @IBOutlet weak var myImageView1: UIImageView! //mySegmentedControl對應的那張圖片 定義
    @IBOutlet weak var sliderLabel: UILabel! //被Slider調整字體大小的文字
    @IBOutlet weak var fontSizeSlider: UISlider! //Slider調整字體大小
    
    
    override func viewDidLoad() {
        myDatePicker.minimumDate = Date() //防止時間變成負數
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //以下時間倒數器
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
    
    //以下是mySegmentedControl的程式碼
    @IBAction func mySegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { //判斷點選了哪個segmented
            myImageView1.image = UIImage(named: "images-4") //顯示 Mickey
        }else {
            myImageView1.image = UIImage(named: "images-2") //顯示 Partners
        }
    }
    
    //以下是用 Slider 調整 font Size 的程式碼
 
    @IBAction func sliderAction(_ sender: UISlider) {
        print("slider value \(fontSizeSlider.value)")
        self.sliderLabel.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
        
    }
}
    

