//
//  FavoriteTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import UIKit
import WebKit

class FavoriteTableViewCell: UITableViewCell {
    @IBOutlet weak var fwbImage: WKWebView!
    @IBOutlet weak var lbGenre: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbView: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
