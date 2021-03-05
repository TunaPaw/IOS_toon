//
//  searchResultTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/05.
//

import UIKit
import WebKit

class searchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var wv: WKWebView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbGenre: UILabel!
    @IBOutlet weak var lbView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



}
