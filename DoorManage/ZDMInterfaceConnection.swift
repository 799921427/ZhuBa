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
  
    func connentNet(method:String,params:[String:String]?,block:@escaping ((_ fail:Int,_ msg:String,_ dictionary:[Cource]? )->Void)){
    
        
        
        
        var urlString = "http://www.honeybees.top:8080/honey/"+method
        var content = ""
        var index = 0;
        var fail : Int = 0
        var dataMsg :String = ""
        var courceArr : [Cource]? = []
        if let param = params
        {
            for (key,value) in param{
                if index == 0{
                    content += key + "=" + value
                    index = 1
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
           // request.httpMethod = "POST"
            
           // var dict:[Cource]?
            var task = session.dataTask(with: request as URLRequest, completionHandler: {
                (data,response,error) in
                //print(data)
                if let error1 = error
                {
                    print(error1.localizedDescription)
                    dataMsg = error1.localizedDescription
                    print("error")
                    
                    
                   
                    
                    
                    fail = 1
                }
                else
                {
                    
                    print("访问成功，获取数据如下")
                    
                    let dicti : AnyObject! = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                    print(dicti)
                    if let dict = dicti as? NSArray
                    {
                        //print(dicti)
                      
                        print("222222222\(dict)")
                        let ditc : [Cource]?
                        for i in 0...2
                        {
                            if let ditc = dict[i] as? [Cource]
                            {
                                if let cources = [Cource].deserialize(from: ditc)
                                {
                                    cources.forEach({ (cource) in
                                        print("11111111\(cource?.id)")
                                    })
                                }
                            }
                            
                        }
                        
//                        let courses = dict.map({ array -> [Cource] in
//                            if let cources =  [Cource].deserialize(from: array)
//                            {
//                                return cources as! [Cource]
//                            }
//                            return []
//                        })
//                        if let cources = [Cource].deserialize(from: dict)
//                        {
//                            
//                        }
                    
                    }
                    //print(dict)
                   // let JSONStr = String(data:data!,encoding:String.Encoding.utf8)
                   // print("$$$$$$:\(JSONStr)")
                    //[Cource].deserialize(from: <#T##NSArray?#>)
//                    if let cources = [Cource].deserialize(from: dict)
//                    {
//                        cources.forEach({(cource) in
//                            print("&&&\(cource?.id)")
//                        })
//                    }
                    
                    fail = 0
                    
                }
            
                
                block(fail,dataMsg,courceArr)
                

           
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
//let SStr : String = "[{\"id\":77,\"foodname\":\"麻婆豆腐\",\"manufacture\":\"1、豆腐切丁，香葱、生姜、大蒜、干辣椒切细末备用。　\r\n2、锅内放入油烧热， 先爆香葱末、生姜末、大蒜末、干辣椒末和豆瓣酱，再放入猪肉馅炒熟。\r\n3、加入适量水，煮开后加入豆腐丁、酱油、白糖煮3分钟。\r\n4、再用水淀粉勾芡后盛入盘中。　　\r\n5、烧热香油，爆香花椒，将花椒油淋在豆腐上即可。 　 \",\"material\":\"豆腐300克，猪肉馅100克，香葱1棵，生姜1小块，大蒜6瓣，花椒1大匙，淀粉适量，干辣椒2个\r\n调料：食用油30克，香油1大匙，酱油1/2大匙，豆瓣酱1大匙，白糖2小匙\",\"photo\":\"image/tofu5.png\",\"type\":3,\"foodtype\":6,\"fooddetailtype\":null,\"tips\":null},{\"id\":43,\"foodname\":\"飘香四季豆\",\"manufacture\":\"1. 将四季豆摘洗干净，用冷水泡半小时；\r\n2. 芽菜洗净切成末；\r\n3. 咸鸭蛋煮熟后取蛋黄切成粒；\r\n4. 葱、姜、蒜洗净切成末；\r\n5. 红辣椒去蒂、籽洗净切粒；\r\n6. 坐锅点火放油，油温四成热时放入四季豆炒软，倒入盘中待用；\r\n7. 锅再点火放油，油热后放入鸭蛋黄粒炒散，倒入芽菜末、葱末、姜末、蒜末、适量高汤、料酒炒出香味，再加入四季豆、红椒粒、胡椒粉、白糖、鸡精，待汁浓时淋入香油，出锅即可。\",\"material\":\"四季豆 400克，咸鸭蛋 50克，宜宾 碎米芽菜 50克，辣椒(红，尖，干) 25克，料酒 胡椒粉鸡精 白砂糖 姜 大蒜 香油 花生油 酱油 \",\"photo\":\"image/vegetable3.png\",\"type\":2,\"foodtype\":4,\"fooddetailtype\":null,\"tips\":\"1.热量(大卡)118.64碳水化合物(克)12.42\r\n脂肪(克)7.44蛋白质(克)3.38\r\n纤维素(克)3.12\r\n2. 扁豆含毒蛋白，凝集素，以及能引起溶血症的皂素。烹调前应用冷水浸泡或焯水处理。\"},{\"id\":46,\"foodname\":\"金针菇菠菜\",\"manufacture\":\"1.　金针菇开罐后，取出，沥干备用；\r\n2.　柚子皮去内膜，皮切成丝备用；\r\n3.　将菠菜洗净，切成3厘米长的小段备用；\r\n4.　将金针菇和菠菜混合在一起，加入调料和白芝麻拌匀后放入微波炉中用中火加热1分30秒；\r\n5.　取出后盛入容器，放上柚皮丝即可。\",\"material\":\"金针菇(罐装) 350克，菠菜 80克，柚子 50克\",\"photo\":\"image/vegetable6.png\",\"type\":2,\"foodtype\":4,\"fooddetailtype\":null,\"tips\":\"金针菇富含B族维生素、维生素C、矿物质、胡萝卜素等，热量却只有26大卡/100g。菠菜富含类胡萝卜素、维生素C。\"},{\"id\":61,\"foodname\":\"排骨莲藕汤\",\"manufacture\":\"1、莲藕去皮洗净切片。\r\n2、排骨洗净，入沸水锅中焯烫出血沫捞出，冲洗干净。\r\n3、将排骨和莲藕放入煮锅，加水没过排骨莲藕。\r\n4、大火烧开，放姜、料酒，转小火炖煮2个小时左右，放适量盐，撒上葱末即可。\",\"material\":\"\r\n莲藕，排骨，葱，姜，料酒，盐\",\"photo\":\"image/soup1.png\",\"type\":2,\"foodtype\":5,\"fooddetailtype\":null,\"tips\":\"莲藕微甜而脆，味道鲜美、营养丰富、长期食用能清热祛痘，滋润皮肤，润燥止渴、清心安神的作用。莲藕味甘，性凉，能凉血止血，散瘀血。熟用微温，能补益脾胃，止泻，益血，生肌。补中养神，延年益寿。补益十二经脉血气，平体内阳热过盛、火旺。固精气，强筋骨，补虚损，利耳目，并除寒湿，止脾泄久痢，女子非经期出血过多等症。莲藕是益脾之果。大便燥涩者不宜多食。\"}]"
//
