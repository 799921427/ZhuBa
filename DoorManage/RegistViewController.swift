//
//  RegistViewController.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/29.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class RegistViewController: UIViewController {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    private var timer : Timer?
    @IBAction func sendMsg(_ sender: Any) {
        self.remainingSeconds = 59
        self.isCounting = !self.isCounting
        sendBtn.isEnabled = false
    }
    private var isCounting:Bool = false
    {
        willSet(newValue)
        {   if newValue
            {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(RegistViewController.updateTimer), userInfo: nil, repeats: true)
            }
            else
            {
                timer?.invalidate()
                timer = nil
            }
        }
                
    }
    private var remainingSeconds:Int = 0{
        willSet(newSeconds)
        {
            let seconds = newSeconds % 60
            sendBtn.setTitle("\(seconds)秒后重新获取", for: .normal)
        }
    }
    
    
   
    
    @objc func updateTimer(timer: Timer) {// 更新时间
        if remainingSeconds > 0 {
            remainingSeconds -= 1
        }
        
        if remainingSeconds == 0 {
            sendBtn.setTitle("获取验证码", for: UIControlState.normal)
            sendBtn.isEnabled = true
            isCounting = !isCounting
            timer.invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView()
    {
        let lineColor = UIColor.init(red: 207.0/255, green: 208.0/255, blue: 209.0/255, alpha: 1)
        self.backView.layer.borderColor = lineColor.cgColor
        self.backView.layer.borderWidth = 0.5
        self.backView.layer.cornerRadius = 3
//        inView.layer.borderColor = lineColor.cgColor
//        inView.layer.borderWidth = 1
//        self.backView.layer.borderWidth = 1;
//        self.backView.layer.borderColor = UIColor.gray.cgColor
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
