//
//  MyCell.swift
//  UseMap
//
//  Created by 503-18 on 2018. 11. 23..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

	@IBOutlet weak var lblName: UILabel!
	@IBOutlet weak var lblPhone: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
