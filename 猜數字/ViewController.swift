//
//  ViewController.swift
//  猜數字
//
//  Created by edisonfang on 2017/6/22.
//  Copyright © 2017年 hsuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    //輸入
    @IBOutlet weak var putin: UITextField!
    
    //提示
    @IBOutlet weak var hint: UILabel!
    
    //猜測次數
    @IBOutlet weak var time: UILabel!
    
    //花花
    @IBOutlet weak var flower: UIImageView!
    
    //眼淚ＱＱ
    @IBOutlet weak var tear: UIImageView!

    //答案
    var answer = 0
    
    //機會有？？
    var times = 6
    
    // 上界
    var upbound = 100
    
    //下界
    var lowbound = 0
    
    @IBAction func gogo(_ sender: Any)
    {
        //收鍵盤
        putin.resignFirstResponder()
        if putin.text == ""
        {
            //使用者沒輸入
            hint.text="小狐狸正等著你給牠一個數字"
        }
        
        else if Int(putin.text!) == nil
        {
            //使用者輸入的不是數字
            hint.text="只能輸入數字喔!"
        }
        
        else if times > 1
        {
            //機會還有一次以上，檢驗輸入值，i是輸入值（整數）
            let i = Int(putin.text!)!
            check(test:i)
        }
        
        else
        {
            //其他
            time.text = "0"
            hint.text = "小狐狸哭哭 沒機會了"
            tear.isHidden = false
        }
    }
        
    func getBoundaryText() -> String
    {
        return "(\(lowbound)~\(upbound))"
    }
    
    func check(test:Int)
    {
        if test > 100
        {
            hint.text = "猜的數字超出範圍嚕!\(getBoundaryText())"
            times -= 1
            time.text = String(times)
    
        }
        else if test > answer
        {
            upbound = test - 1
            hint.text = "沒有這麼多朵\(getBoundaryText())"
            times -= 1
            time.text = String(times)
    
        }
        else if test < answer
        {
            lowbound = test + 1
            hint.text = "太少朵了吧!\(getBoundaryText())"
            times -= 1
            time.text = String(times)
        }
        else
        {
            hint.text = "答對了!就是\(answer)朵 送你一朵玫瑰"
            flower.isHidden = false
        }
    }

    @IBAction func re(_ sender: Any)
    {
        hint.text = "放膽去猜!!"
        putin.text = "0"
        times = 6
        upbound = 50
        lowbound = 0
        answer = Int(arc4random_uniform(50))
        time.text = String(times)
        flower.isHidden = true
        tear.isHidden = true
    }
    
    
    //按按鈕收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        putin.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answer = Int(arc4random_uniform(100))
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

