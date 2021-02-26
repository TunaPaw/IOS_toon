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
    
   
    @IBOutlet weak var txtCover: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtGenre: UITextField!
    @IBOutlet weak var txtView: UITextField!
    
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
    
   
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtCover.text = receivecover
        txtTitle.text = receiveTitle
        txtGenre.text = receiveGenre
        txtView.text = receiveView
        // Do any additional setup after loading the view.
        
        let url = URL(string: "\(receivecover)")
        let request = URLRequest(url: url!)

        self.wbImage.load(request)
        
        //https://www.youtube.com/watch?v=vaTZnfpBDEI
        let url2 = URL(string: "\(receivecover)")
        let request2 = URLRequest(url: url2!)
        webView2.load(request2)
       
    }
   
    @IBAction func btnStar(_ sender: UIButton) {
        if sender.isSelected{
            let userAlert = UIAlertController(title: "알림", message: "즐겨찾기를 취소합니다.", preferredStyle: UIAlertController.Style.actionSheet)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            userAlert.addAction(onAction)
            present(userAlert, animated: true, completion: nil)
            
        }else{
            let userAlert = UIAlertController(title: "알림", message: "즐겨찾기 목록에 추가합니다.", preferredStyle: UIAlertController.Style.actionSheet)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
            userAlert.addAction(onAction)
            present(userAlert, animated: true, completion: nil)
        }
        sender.isSelected.toggle()
    }
    
    @IBAction func btnCart(_ sender: UIButton) {
        let userAlert = UIAlertController(title: "알림", message: "장바구니에 담겼습니다.", preferredStyle: UIAlertController.Style.actionSheet)
        let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
        userAlert.addAction(onAction)
        present(userAlert, animated: true, completion: nil)
    }
    
    func receiveItems( _ code: String, _ cover: String, _ title: String, _ genre: String, _ view: String, _ insert: String, _ delete: String, _ author: String, _ subtitle: String, _ episode: String){
        
        
        receivecode = code
        receivecover = cover
        receiveTitle =  title
        receiveGenre = genre
        receiveView = view
        receiveinsert = insert
        receivedelete = delete
        receiveAuthor = author
        receivedelete = subtitle
        receiveepisode = episode
    }


}
