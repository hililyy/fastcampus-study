//
//  StopWatchTableViewCell.swift
//  Clock
//
//  Created by 강조은 on 2021/08/24.
//

import UIKit
class StopWatchTableViewCell: UITableViewCell {
    static let cell_id = "cell_id_lap"
    var count = 1

    @IBOutlet var lblLabIndex: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblLabIndex.text = ""
        lblTime.text = ""
    }
}

