//
//  myFavoriteTableViewCell.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/03/24.
//

import UIKit
import WebKit

class myFavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var wv: WKWebView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
