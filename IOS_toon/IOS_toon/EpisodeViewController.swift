//
//  EpisodeViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit
import WebKit


class EpisodeViewController: UIViewController, EpisodeViewModelProtocol {
    func itemDownloaded(items: NSArray) {
        feedItem = items
    }
    
    var receiveepicon: String = ""

    

    @IBOutlet weak var wbEpi: WKWebView!
  
    var feedItem: NSArray = NSArray()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let episodeViewModel = EpisodeViewModel()
        episodeViewModel.delegate = self
        episodeViewModel.downloadItems()
        
        wbEpi?.load(URLRequest(url: URL(string: "\(receiveepicon)")!))
  
    
    }
    
    func receiveItem(_ epicon: String){
        receiveepicon = epicon
    }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
