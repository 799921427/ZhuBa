//
//  EveryDayView.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/14.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var menuList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBarController?.tabBar.isHidden = false
        self.createTitle("煮吧", titleImage: "logo", backImage:"nav", rightImgae: "search")
        let nib = UINib(nibName:"MyTableViewCell3",bundle:nil);
        self.menuList.register(nib, forCellReuseIdentifier: "Cell3")
        //self.menuList.register(nib2, forCellReuseIdentifier: "Cell2")
        self.menuList.separatorStyle = .none
        self.menuList.separatorColor = .clear
        
        self.menuList.delegate = self
        self.menuList.dataSource = self
        
        //        self.myTableView.estimatedRowHeight = 150
        //        self.myTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
//        根据Bundle拿到storyboard
        let story = UIStoryboard(name: "Main", bundle: nil)
        //家在storyboard里的视图控制器
        let menuDetailController = story.instantiateViewController(withIdentifier: "MenuDetail")
        menuDetailController.navigationController?.navigationBar.isHidden = true
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(menuDetailController, animated: true)
//        let netConnect = ZDMInterfaceConnection()
//        var dic:[String:String]?
//        netConnect.connentNet(method: "news_getTypes", params: dic, block: {
//            (success,msg,dict) in
//            print(success)
//            print(msg)
//            print(dict)
//        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell : MyTableViewCell3 = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! MyTableViewCell3
            cell.selectedBackgroundView = UIView()
            cell.selectedBackgroundView?.backgroundColor = UIColor(red:243/255.0,green:154/255.0,blue:6/255.0,alpha:0.4)
            print("mmp1")
            return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
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

