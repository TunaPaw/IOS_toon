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
    
    @IBOutlet weak var lbCode: UITextField!
    @IBOutlet weak var lbTitle: UITextField!
    @IBOutlet weak var lbGenre: UITextField!
    @IBOutlet weak var lbView: UITextField!
    
    
    var receiveId = ""
    var receiveName =  ""
    var receiveDept = ""
    var receivePhone = ""
    
    var db: OpaquePointer?
    var detailList:[ContentDBModel] = []
    
   
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbCode.text = receiveId
        lbTitle.text = receiveName
        lbGenre.text = receiveDept
        lbView.text = receivePhone
        // Do any additional setup after loading the view.
        
        let url = URL(string: "\(receiveId)")
        let request = URLRequest(url: url!)

        self.wbImage.load(request)
        
        
        let url2 = URL(string: "https://www.youtube.com/watch?v=vaTZnfpBDEI")
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
    
    func receiveItems(_ id: String, _ name: String, _ dept: String, _ phone: String){
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }


}
