//
//  ViewController.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/2/25.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit
extension UIButton {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = UIColor(red:243/255.0,green:154/255.0,blue:6/255.0,alpha:0.4)
    }
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = .clear
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var inView: UIView!
    @IBOutlet weak var registBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController
{
    fileprivate func setupUI()
    {
        let lineColor = UIColor.init(red: 207.0/255, green: 208.0/255, blue: 209.0/255, alpha: 1)
        line.layer.borderColor = lineColor.cgColor
        line.layer.borderWidth = 0.5
        inView.layer.borderColor = lineColor.cgColor
        inView.layer.borderWidth = 1
        let btnColor = UIColor.init(red: 255.0/255, green: 140.0/255, blue: 43.0/255, alpha: 1)
        registBtn.layer.borderColor = btnColor.cgColor
        registBtn.layer.borderWidth = 1
    }
}
