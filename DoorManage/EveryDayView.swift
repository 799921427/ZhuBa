//
//  EveryDayView.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/14.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class EveryDayView: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myTableView: UITableView!
    

    @IBOutlet weak var listTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        self.createTitle("煮吧", titleImage: "logo", backImage:"nav", rightImgae: "search")
        let nib = UINib(nibName:"MyTableViewCell1",bundle:nil);
        self.myTableView.register(nib, forCellReuseIdentifier: "Cell1")
        let nib2 = UINib(nibName:"MyTableViewCell2",bundle:nil);
        self.myTableView.register(nib2, forCellReuseIdentifier: "Cell2")
        self.myTableView.separatorStyle = .none
        self.myTableView.separatorColor = .clear
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
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
        //根据Bundle拿到storyboard
        let story = UIStoryboard(name: "Main", bundle: nil)
        //家在storyboard里的视图控制器
        let menuController = story.instantiateViewController(withIdentifier: "tabBar")
        menuController.navigationController?.navigationBar.isHidden = true
        menuController.view.backgroundColor = .white
       
        self.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(menuController, animated: true)
        self.hidesBottomBarWhenPushed = false
        let netConnect = ZDMInterfaceConnection()
        var dic:[String:String]?
        netConnect.connentNet(method: "news_getTypes", params: dic, block: {
            (success,msg,dict) in
            print(success)
            print(msg)
            print(dict)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0
        {
            
            let cell1 : MyTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! MyTableViewCell1
            cell1.selectedBackgroundView = UIView()
            cell1.selectedBackgroundView?.backgroundColor = UIColor(red:243/255.0,green:154/255.0,blue:6/255.0,alpha:0.4)
           // let img = loadImg(imgURL: "http://www.honeybees.top:8080/honey/image/m16.png",imgView: cell1.menuImg)
            print("mmp1")
            return cell1
        }
        else
        {
            let cell2 : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! UITableViewCell
            cell2.selectedBackgroundView = UIView()
            cell2.selectedBackgroundView?.backgroundColor = UIColor(red:243/255.0,green:154/255.0,blue:6/255.0,alpha:0.4)
            print("mmp2")
            return cell2
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {return 165}
        else
        {return 140}
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func loadImg(imgURL : String,imgView : UIImageView) -> Void
    {
        let picURL = URL(string: imgURL)
        
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: picURL!) {(data,response,error) in
            
            if let e = error
            {
                print("Error \(e)")
            }
            else
            {
                if let imgData = data
                {
                    let img = UIImage(data:imgData)
                    DispatchQueue.main.async {
                        imgView.image = img
                    }
                }
                
            }
        }
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
