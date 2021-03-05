//
//  EpisodeViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import UIKit
import WebKit


class EpisodeViewController: UIViewController, EpisodeViewModelProtocol {
    

    var receiveepicon: String = ""

    @IBOutlet weak var wbEpi: WKWebView!
  
    var feedItem: String = String()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let episodeViewModel = EpisodeViewModel()
        episodeViewModel.delegate = self
        episodeViewModel.downloadItems()
        

        
//        print("뷰url\(feedItem)")
      //  wbEpi?.load(URLRequest(url: URL(string: "\(feedItem)")!))
        wbEpi.load(URLRequest(url: URL(string: "http://batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174036&is=8147&cid=")!))
        
  
    
    }
    func itemDownloaded(items: String) {
        feedItem = items
        print("aaaaaaa\(feedItem)")
        
    }
    
    func receiveItem(_ epicon: String){
      //  receiveepicon = epicon
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
