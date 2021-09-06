//
//  timerSingleCell.swift
//  Clock
//
//  Created by 강조은 on 2021/09/05.
//

import UIKit

class timerSingleCell: UITableViewCell {

    @IBOutlet var lbltext: UILabel!
    @IBOutlet var selectSound: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
