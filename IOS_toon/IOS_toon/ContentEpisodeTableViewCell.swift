//
//  ContentEpisodeTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/26.
//

import UIKit

class ContentEpisodeTableViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func btnCheck(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
