//
//  JoinViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/19.
//

import UIKit

class JoinViewController: UIViewController, JspModelProtocol {


    

    

    


    @IBOutlet weak var txtJoinName: UITextField!
    @IBOutlet weak var txtJoinEmail: UITextField!
    @IBOutlet weak var txtJoinPostcode: UITextField!
    @IBOutlet weak var txtJoinAddr: UITextField!
    @IBOutlet weak var txtJoinPassword: UITextField!
    @IBOutlet weak var txtJoinPasswordCheck: UITextField!
    @IBOutlet weak var txtJoinTel: UITextField!
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        txtJoinPassword.textContentType = .newPassword
//        txtJoinPassword.isSecureTextEntry = true
//        txtJoinPasswordCheck.textContentType = .newPassword
//        txtJoinPasswordCheck.isSecureTextEntry = true
        let emailCheckModel = EmailCheckModel()
        emailCheckModel.delegate = self
        

    }
    

   // var feedItem: NSArray = NSArray()

    var feedItem: String = ""
    
    func itemDownloaded(items: String) {
        feedItem = items
        print("아이템다운로드\(feedItem)")
    }

    
    
    @IBAction func btnJoinEmailCheck(_ sender: UIButton) {
        
        let emailCheckModel = EmailCheckModel()
        emailCheckModel.delegate = self
        emailCheckModel.checkItems(Email: txtJoinEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        
        
        
        print("joinview\(feedItem)")
       
        if Int(feedItem) == 0{
            let resultAlert = UIAlertController(title: "성공", message: "사용가능한 아이디 입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else if Int(feedItem) == 1{
            let resultAlert = UIAlertController(title: "실패", message: "사용중인 아이디 입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
               
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)

            }
        
        
    }
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func btnJoin(_ sender: UIButton) {
        let UEmail = txtJoinEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UName = txtJoinName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UPassword = txtJoinPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UPasswordCheck = txtJoinPasswordCheck.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UPostcode = txtJoinPostcode.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UAddr = txtJoinAddr.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let UTel = txtJoinTel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        func displayAlertMessage(userMessage: String){
            let myAlert = UIAlertController(title: "알림", message: userMessage, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
        }
       
        
        
    if(UEmail=="" || UPassword=="" || UPasswordCheck=="" || UPostcode == "" || UAddr == "" || UName == "" || UTel == ""){
        displayAlertMessage(userMessage: "빈칸이 없게 입력해주세요");
        return;
    }else{
        let insertModel = InsertModel()
        let result = insertModel.insertItems(Email: UEmail, Name: UName, Tel: UTel, Postcode: UPostcode, Addr: UAddr, Password: UPassword, PasswordCheck: UPasswordCheck)
        if result == true{
            let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }else{ // 에러일 경우
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
        
    }
    if(UPassword != UPasswordCheck){
        displayAlertMessage(userMessage: "비밀번호가 일치하지 않습니다.");
        return;
    }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
