//
//  MainPopCollectionViewCell.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/03.
//

import UIKit
import WebKit

class MainPopCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var wbCover: WKWebView!
    @IBOutlet weak var lbTitle: UILabel!
    
    var isInBackground = true {
        didSet {
            UIView.animate(withDuration: 0.2) {
                self.autoResize()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
        autoResize()
    }
    
    /// Responsible for resizing the cell.
    private func autoResize() {
        switch self.isInBackground {
        case true:
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        case false:
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
