//
//  AttractionTableViewCell.swift
//  SubDataDisplay
//
//  Created by 503-18 on 2018. 11. 12..
//  Copyright © 2018년 TaeMin Bang. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	@IBOutlet weak var attractionLabel: UILabel!
	@IBOutlet weak var attractionImage: UIImageView!
	
	override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
