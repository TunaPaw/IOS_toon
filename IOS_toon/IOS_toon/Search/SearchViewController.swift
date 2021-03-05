//
//  SearchViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/19.
//

import UIKit

class SearchViewController: UIViewController {
    

    @IBOutlet weak var SearchView: UIView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    var Stsearch : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondAnimation()
        
//        guard let text = """
// <div class="search-wrapper">
//    <div class="input-holder">
//        <input type="text" class="search-input" placeholder="Type to search" />
//        <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
//    </div>
//    <span class="close" onclick="searchToggle(this, event);"></span>
//</div>
//""".data(using: String.Encoding.unicode) else {
//
//                    return
//
//                }

//                try? mTvText.attributedText = NSAttributedString(data: text, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
//
//                self. mTvText.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {//애니메이션
    super.viewWillAppear(animated)
    SearchView.center.y -= view.bounds.height //위에 숨겨져 있음
//    secondLabel.center.y += view.bounds.height //아래에 숨겨져있음
  // hiddenLabel.alpha = 0.0 // 알파0
    }
    func secondAnimation() {
    //animate second label
        UIView.animate(withDuration: 1.1, delay: 0.0, options: [], animations: {
        self.SearchView.center.y += self.view.bounds.height
        }, completion:nil)
    }
    @IBAction func btnSearch(_ sender: UIButton) {
        Stsearch = SearchBar.text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgSearch"{
            let detailView = segue.destination as! SearchResultTableViewController
  
            let search = Stsearch
            Share.search = search
            detailView.receiveItems(search)
         
        }
            
        
    }
    
    
}
