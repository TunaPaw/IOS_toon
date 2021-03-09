//
//  FindViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/18.
//

import UIKit

class FindViewController: UIViewController, findPwModelProtocol, findIdModelProtocol{

    

    

    @IBOutlet weak var findChoice: UISegmentedControl!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    var findPW: String = ""
    var findId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblId.text = "전화번호"
        swipeRecognizer()
    }
    
    @IBAction func Findchoice(_ sender: UISegmentedControl) {
 
            if findChoice.selectedSegmentIndex == 0{
                lblId.text = "전화번호"
                
            }else if findChoice.selectedSegmentIndex == 1{
                lblId.text = "이메일"
                self.lblId.isHidden = false
                self.txtId.isHidden = false

            }
    }
    
    @IBAction func btnFind(_ sender: UIButton) {
        if findChoice.selectedSegmentIndex == 1 {
           let findpwModel = findPwModel()
            findpwModel.delegate = self
            findpwModel.checkItems(UserId: txtId.text!, UserName: txtName.text!)
            print("findPw: \(findPW)")
        }
        if findChoice.selectedSegmentIndex == 0{
            let findidModel = findIdModel()
            findidModel.delegate = self
            findidModel.checkItems(UserName: txtId.text!, UserTel: txtName.text!)
            print("findId: \(findId)")
        }
    }
    func itemDownloaded(items: String) {
        findPW = items
        print("findPw: \(findPW)")
        if findPW == ""{
            let myAlert = UIAlertController(title: "알림", message: "정보를 확인하세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
        }else if findPW != nil{
            let myAlert = UIAlertController(title: "알림", message: "비밀번호는 \(findPW) 입니다!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
            navigationController?.popViewController(animated: true)
        }
    }
    
    func itemDownloaded2(items2: String) {
        findId = items2
        print("findId: \(findId)")
        if findId == ""{
            let myAlert = UIAlertController(title: "알림", message: "정보를 확인하세요", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
        }else if findId != nil{
            let myAlert = UIAlertController(title: "알림", message: "아이디는 \(findId) 입니다!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
        }

    }
    
    // 아무곳이나 클릭하여 키보드숨김
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // 오른쪽으로 밀어 뒤로가기
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.right:
                // 스와이프 시, 원하는 기능 구현.
                self.dismiss(animated: true, completion: nil)
            default: break
            }
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

}
