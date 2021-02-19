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

        // Do any additional setup after loading the view.
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
    }
    
    
    // 빈칸 체크 함수
    func signUpAlert(_ field: UITextField) {
        DispatchQueue.main.async {
            var title = ""
            switch field {
            case self.txtJoinPassword:
                title = "비밀번호를 입력해주세요."
            case self.txtJoinPasswordCheck:
                title = "비밀번호를 확인해주세요."
            case self.txtJoinName:
                title = "이름을 입력해주세요."
            case self.txtJoinEmail:
                title = "이메일을 입력해주세요."
            case self.txtJoinAddr:
                title = "주소 입력해주세요."
            case self.txtJoinPostcode:
                title = "우편번호를 입력해주세요."
            default:
                title = "Error"
            }
            let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "닫기", style: .cancel) { (action) in
                
            }
            
            controller.addAction(cancelAction)
            self.present(controller, animated: true, completion: nil)
        }
    }

    func validpassword(mypassword : String) -> Bool {//숫자+문자 포함해서 8~20글자 사이의 text 체크하는 정규표현식
        let passwordreg = ("(?=.*[A-Za-z])(?=.*[0-9]).{8,20}")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: mypassword)
    }


}
