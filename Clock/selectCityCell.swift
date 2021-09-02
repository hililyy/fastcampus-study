//
//  selectCityCell.swift
//  Clock
//
//  Created by 강조은 on 2021/09/02.
//

import UIKit

class selectCityCell: UITableViewCell {

    @IBOutlet var lblCityName: UILabel!
    @IBOutlet var lblCityClock: UILabel!
    @IBOutlet var lblNowClock1: UILabel!
    @IBOutlet var lblNowClock2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
