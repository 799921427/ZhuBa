//
//  ZDMInterfaceConnection.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/16.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class ZDMInterfaceConnection: NSObject {
    var session : URLSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
  
    func connentNet(method:String,params:[String:String]?,block:@escaping ((_ fail:Int,_ msg:String,_ dictionary:[String:NSObject]? )->Void)){
    
        var urlString = "http://59.77.134.231/fellow/ajax/"+method
        var content = ""
        var index = 0;
        var fail : Int = 0
        var dataMsg :String = ""
        if let param = params
        {
            for (key,value) in param{
                if index == 0{
                    content += key + "=" + value
                }
                else{
                    content += "&" + key + "=" + value
                }
            }
        }
        
        if let url = URL(string:urlString)
        {
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpBody = content.data(using: .utf8)
            request.httpMethod = "POST"
            
            var dict:[String:NSObject]?;
            var task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data,response,error) in
                //print(data)
                if let error1 = error
                {
                    print(error1.localizedDescription)
                    dataMsg = error1.localizedDescription
                    
                    fail = 1
                }
                else
                {
                    
                    print("访问成功，获取数据如下")
                    
                    if let dicti = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)  {
                     //   print(dicti)
                        dict = dicti as! [String : NSObject]
                        }
                    //print(dict)
                    fail = 0
                    
                }
            
                
                block(fail,dataMsg,dict)
                

           
                })
            task.resume()
        }
        
        
    }
//    var session:URLSession{
//        get{
//            return URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue())
//        }
//    }
}
