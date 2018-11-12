//
//  CustomCell.swift
//  TableView.181112
//
//  Created by 503-18 on 2018. 11. 12..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var lblSkill: UILabel!
	@IBOutlet weak var lblName: UILabel!
	
	override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
