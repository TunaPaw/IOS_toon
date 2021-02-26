//
//  BookTableViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import UIKit
import WebKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BwbImage: WKWebView!
    @IBOutlet weak var BlbCode: UILabel!
    @IBOutlet weak var BlbView: UILabel!
    @IBOutlet weak var BlbTitle: UILabel!
    @IBOutlet weak var BlbGenre: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
