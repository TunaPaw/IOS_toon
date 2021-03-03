//
//  ViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/18.
//

import UIKit

class ViewController: UIViewController, LoginModelProtocol {

    
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
   
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtUserId.becomeFirstResponder()
//  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back2.jpg")!)
    }

    @IBAction func btnOk(_ sender: UIButton) {
        
        let UEmail = txtUserId.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UPassword = txtUserPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let loginCheckModel = LoginModel()
        loginCheckModel.delegate = self
        loginCheckModel.checkItems(UserId: UEmail, UserPw: UPassword)
    }

    
    var feedItem: String = ""
    func itemDownloaded(items: String) {
        feedItem = items
        if Int(feedItem) == 1{
            Share.userID = self.txtUserId.text!
            self.performSegue(withIdentifier: "afterChecking", sender: self)
        }else if Int(feedItem) == 0{
            let myAlert = UIAlertController(title: "알림", message: "ID와 비밀번호를 확인하세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
            txtUserPassword.text = ""
            txtUserId.text = ""
            self.txtUserId.becomeFirstResponder()
        }
    }
    
    
    @IBAction func btnGuest(_ sender: UIButton) {
        self.performSegue(withIdentifier: "afterChecking", sender: self)
    }
    
// 키보드 숨기기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myPageSegue"{
            let myPageView = segue.destination as! MyPageViewController
            
            // let item: Students = studentsList[(indexPath! as NSIndexPath).row]
            let item: DBModel = feedItem as! DBModel // NSIndexPath 생략가능
            
            let UPassword = item.UPassword
            let UName = item.UName
            let UTel = item.UTel
            let UPostcode = item.UPostcode
            let UAddr = item.UAddr
            
            myPageView.receiveItems(UPassword:UPassword, UName: UName, UTel: UTel, UPostcode: UPostcode, UAddr:UAddr)
        }
    }
    
    
}//-------------------------

