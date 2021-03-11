//
//  ContentDetailViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/25.
//

import UIKit
import WebKit

class ContentDetailViewController: UIViewController {
    
    @IBOutlet weak var wbImage: WKWebView!
    @IBOutlet weak var webView2: WKWebView!
    
   

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtGenre: UITextField!
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtEpisode: UITextField!
    
    @IBOutlet weak var tvSubTitle: UITextView!
    
    var receivecode = ""
    var receivecover = ""
    var receiveTitle =  ""
    var receiveGenre = ""
    var receiveView = ""
    var receiveinsert = ""
    var receivedelete = ""
    var receiveAuthor = ""
    var receivesubtitle = ""
    var receiveepisode = ""
    
    var db: OpaquePointer?
    var detailList:[ContentDBModel] = []
    
    var feedItem: NSArray = NSArray()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        txtTitle.text = receiveTitle
        txtGenre.text = receiveGenre
        txtView.text = "현재 \(receiveView) VIEW"
        txtAuthor.text = receiveAuthor
        txtEpisode.text = "총 \(receiveepisode)회차"
        
        tvSubTitle.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        // Do any additional setup after loading the view.
        
        let url = URL(string: "\(receivecover)")
        let request = URLRequest(url: url!)

        self.wbImage.load(request)
        
        //https://www.youtube.com/watch?v=vaTZnfpBDEI?playinline=1
        let url2 = URL(string: "\(receivecover)")
        let request2 = URLRequest(url: url2!)
        webView2.load(request2)
        

       
    }
   
//    @IBAction func btnStar(_ sender: UIButton) {
//        if sender.isSelected{
//            let userAlert = UIAlertController(title: "알림", message: "즐겨찾기를 취소합니다.", preferredStyle: UIAlertController.Style.actionSheet)
//            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
//            userAlert.addAction(onAction)
//            present(userAlert, animated: true, completion: nil)
//            
//        }else{
//            let userAlert = UIAlertController(title: "알림", message: "즐겨찾기 목록에 추가합니다.", preferredStyle: UIAlertController.Style.actionSheet)
//            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
//            userAlert.addAction(onAction)
//            present(userAlert, animated: true, completion: nil)
//        }
//        sender.isSelected.toggle()
//    }
//    
//    @IBAction func btnCart(_ sender: UIButton) {
//        let userAlert = UIAlertController(title: "알림", message: "장바구니에 담겼습니다.", preferredStyle: UIAlertController.Style.actionSheet)
//        let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
//        userAlert.addAction(onAction)
//        present(userAlert, animated: true, completion: nil)
//    }
//

    func receiveItems( _ code: String, _ cover: String, _ title: String, _ genre: String, _ view: String, _ insert: String, _ delete: String, _ author: String, _ subtitle: String, _ episode: String){
        
        
        receivecode = code
        receivecover = cover
        receiveTitle =  title
        receiveGenre = genre
        receiveView = view
        receiveinsert = insert
        receivedelete = delete
        receiveAuthor = author
        receivesubtitle = subtitle
        receiveepisode = episode
    }

//Contentcode 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if Share.userID == ""{
            let myAlert = UIAlertController(title: "알림", message: "로그인 후 사용가능합니다!", preferredStyle: UIAlertController.Style.alert)
                       let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
                       myAlert.addAction(okAction)
                       self.present(myAlert, animated:true, completion:nil);

            
        }else{
        if segue.identifier == "sgReview"{
            let detailView = segue.destination as! ReviewTableViewController
            let cover = receivecover
            
            Share.nowContentCode = receivecode
            
            detailView.receiveItem(cover)
        }
        if segue.identifier == "sgEpisode"{
            let detailView = segue.destination as! EpisodeTableViewController
            let cover = receivecover
            let code = receivecode
            let epi = receiveepisode
            
            //Share.nowContentCode = ""
            Share.nowContentCode = receivecode
            
            detailView.receiveItem(code, epi, cover)
            
        }
    }
    }
}
