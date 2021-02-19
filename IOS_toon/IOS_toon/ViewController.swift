//
//  ViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
   
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
//  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back2.jpg")!)
    }

    @IBAction func btnOk(_ sender: UIButton) {
        if txtUserId.text == "aaa" && txtUserPassword.text == "1111"{
            Share.userID = txtUserId.text!
                    self.performSegue(withIdentifier: "afterChecking", sender: self) // segue로 넘겨주는
                }else{
                    let userAlert = UIAlertController(title: "경고", message: "ID나 암호가 틀렸습니다", preferredStyle: UIAlertController.Style.actionSheet)
                    let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil)
                    userAlert.addAction(onAction)
                    present(userAlert, animated: true, completion: nil)
                }
    }
    
    @IBAction func btnGuest(_ sender: UIButton) {
        self.performSegue(withIdentifier: "afterChecking", sender: self)
    }



}

