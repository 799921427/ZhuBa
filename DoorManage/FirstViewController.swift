//
//  FirstViewController.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/3.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit
import LLCycleScrollView

class FirstViewController: UIViewController {
    
    @IBOutlet weak var bannerView: LLCycleScrollView!
    @IBOutlet weak var tab1: UITabBarItem!
    
    @IBAction func loadMenuData(_ sender: Any) {
        print("&&&&&&")
        var cArr : [Cource]?
        ZDMInterfaceConnection().connentNet(method: "select/selectdinner.rest", params: [:], block: {
            (fail,dataMsg,courceArr) in
            cArr = courceArr
            print(fail)
            print(dataMsg)
            print(courceArr)
        })
        let everyDayView : EveryDayView = self.storyboard?.instantiateViewController(withIdentifier: "EveryDayView") as! EveryDayView
        everyDayView.courceArr = cArr
//        for c in cArr!
//        {
//            print(c.foodname)
//        }
        everyDayView.intNum = 1
        self.navigationController?.pushViewController(everyDayView, animated: true)
//        let jsonString = "{\"id\":12345,\"color\":\"black\",\"name\":\"cat\"}"
//
//        let jsonArrayString: String? = "[{\"name\":\"Bob\",\"id\":\"1\"}, {\"name\":\"Lily\",\"id\":\"2\"}, {\"name\":\"Lucy\",\"id\":\"3\"}]"
//        if let cats = [Cat].deserialize(from: jsonArrayString) {
//            cats.forEach({ (cat) in
//                print(cat?.name)
//            })
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  tab1.selectedImage = UIImage(named:"tab1")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

       // tab1.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13)], for: .normal)
      //  tab1.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13)], for: .selected)
        //tab1.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor(red:243/255.0,green:154/255.0,blue:6/255.0,alpha:1.0)], for: UIControlState.selected)
        self.createTitle("煮吧", titleImage: "logo", leftImage: "nav", rightImgae: "search")
        self.setUpCycleView()
       // self.title = "煮吧"
     //   // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpCycleView()
    {
       
        let imagesURLStrings = [
            "banner.png",
            "banner.png",
            "banner.png",
            "banner.png"]
        self.bannerView.imagePaths = imagesURLStrings
        self.bannerView.imageViewContentMode = .scaleToFill
        self.bannerView.customPageControlStyle = .snake
        self.bannerView.pageControlPosition = .center
        self.bannerView.isAddingPercentEncodingForURLString = true
        
        
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
