//
//  ReviewTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var tfReview: UITextField!
    @IBOutlet weak var txtUserNick: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
