//
//  SecTableViewCell.swift
//  MrtStation1
//
//  Created by Jin Lee on 2016/5/26.
//  Copyright © 2016年 Jin Lee. All rights reserved.
//

import UIKit

class SecTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var secondLineNum: UILabel!
    
    @IBOutlet weak var firstLineNum: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
