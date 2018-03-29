//
//  MyTableViewCell1.swift
//  DoorManage
//
//  Created by 张德茂 on 2018/3/14.
//  Copyright © 2018年 张德茂. All rights reserved.
//

import UIKit

class MyTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    //recipe 配方
    @IBOutlet weak var recipe1: UILabel!
    @IBOutlet weak var recipe2: UILabel!
    @IBOutlet weak var recipe3: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    func setUpUI()
    {
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
