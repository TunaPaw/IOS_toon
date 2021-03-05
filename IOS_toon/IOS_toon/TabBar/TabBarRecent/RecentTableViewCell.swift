//
//  RecentTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import UIKit
import WebKit

class RecentTableViewCell: UITableViewCell {
    @IBOutlet weak var RwbImage: WKWebView!
    @IBOutlet weak var RlbView: UILabel!
    @IBOutlet weak var RlbTitle: UILabel!
    @IBOutlet weak var RlbGenre: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
