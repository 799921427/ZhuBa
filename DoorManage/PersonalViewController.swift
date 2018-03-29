//
//  PersonalViewController.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/7.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit


class PersonalViewController: UITableViewController{

    var dataSource1 : NSArray!
    var dataSource2 : NSArray!
    
    //@IBOutlet var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.createTitle("煮吧", titleImage: "logo", leftImage: "nav", rightImgae: "letter")
        dataSource1 = ["地址","收藏"]
        dataSource2 = ["推荐有奖","金币商城","我的客服","加盟合作"]
    
        self.tableView.isScrollEnabled = false
        let nib = UINib(nibName:"HeadTableViewCell",bundle:nil);
        self.tableView.register(nib, forCellReuseIdentifier: "HeadView")
        let nib2 = UINib(nibName:"cell2",bundle:nil);
        self.tableView.register(nib2, forCellReuseIdentifier: "HeadView2")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        // #warning Incomplete implementation, return the number of rows
        if section == 0
        {
            return 1
        }
        else if section == 1
        {
            return 2
        }
        else
        {
            return 4
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0
            {return 8}
        else if section == 2
        {return 60}
        else {return 16}
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
            {return 160}
        else{ return 60}
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id : String = "cell"
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: id as String)
        cell.accessoryType = .disclosureIndicator
        if indexPath.section == 0
        {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "HeadView") as! HeadTableViewCell
       
//            let view : HeadView = nibView.object(at: 0) as! HeadView
//
//            cell.selectionStyle = .none
//            cell.contentView.addSubview(view)

        }
        else if indexPath.section == 1
        {
            cell.textLabel?.text = dataSource1.object(at: indexPath.row) as! String
        }
        else
        {
            cell.textLabel?.text = dataSource2.object(at: indexPath.row) as! String
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
