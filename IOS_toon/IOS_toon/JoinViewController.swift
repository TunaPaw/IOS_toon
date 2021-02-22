//
//  JoinViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/19.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var txtJoinName: UITextField!
    @IBOutlet weak var txtJoinEmail: UITextField!
    @IBOutlet weak var txtJoinPostcode: UITextField!
    @IBOutlet weak var txtJoinAddr: UITextField!
    @IBOutlet weak var txtJoinPassword: UITextField!
    @IBOutlet weak var txtJoinPasswordCheck: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtJoinPassword.textContentType = .newPassword
        txtJoinPassword.isSecureTextEntry = true
        txtJoinPasswordCheck.textContentType = .newPassword
        txtJoinPasswordCheck.isSecureTextEntry = true
      
    }
    
    @IBAction func btnJoinEmailCheck(_ sender: UIButton) {
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
        let userEmail = txtJoinEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userName = txtJoinName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userPw = txtJoinPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userPwCheck = txtJoinPasswordCheck.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userPostcode = txtJoinPostcode.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let userAddr = txtJoinAddr.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        func displayAlertMessage(userMessage: String){
            let myAlert = UIAlertController(title: "알림", message: userMessage, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
        }
       
        
        
    if(userEmail=="" || userPw=="" || userPwCheck=="" || userPostcode == "" || userAddr == "" || userName == ""){
        displayAlertMessage(userMessage: "빈칸이 없게 입력해주세요");
        return;
    }
    if(userPw != userPwCheck){
        displayAlertMessage(userMessage: "비밀번호가 일치하지 않습니다.");
        return;
    }
        
    }
    
}
