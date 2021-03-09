//
//  EpisodeViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit
import WebKit


class EpisodeViewController: UIViewController {
    
    var receiveEpicon: String = ""

    @IBOutlet weak var wbEpi: WKWebView!
  
    var feedItem: String = ""
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wbEpi.load(URLRequest(url: URL(string: receiveEpicon)!))
        
    }
    
    
    func receiveItem(_ epicon: String){
        receiveEpicon = epicon
    }
    
}
