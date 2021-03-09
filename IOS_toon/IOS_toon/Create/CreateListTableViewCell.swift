//
//  CreateListTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/10.
//

import UIKit
import WebKit

class CreateListTableViewCell: UITableViewCell {
    @IBOutlet weak var wb: WKWebView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbGenre: UILabel!
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
