//
//  RegistViewController.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/29.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class RegistViewController: UIViewController {

    @IBOutlet weak var backView: UIView!
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
