//
//  MyPageViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/19.
//

import UIKit



class MyPageViewController: UIViewController, myPageModelProtocol{
    
    var dsAddr = ""
    var dsName = ""
    var dsPassword = ""
    var dsPostcode = ""
    var dsTel = ""
    
    
    
    @IBOutlet weak var myAddr: UITextField!
    @IBOutlet weak var myPostcode: UITextField!
    @IBOutlet weak var myTel: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var myName: UITextField!
    
    var name: NSString = ""
    var feedItem: NSArray = NSArray()
    func itemDownloaded(items: NSArray) {
        feedItem = items
        let item: DBModel = feedItem[0] as! DBModel
        myPassword.text = item.UPassword!
        myName.text = item.UName!
        myAddr.text = item.UAddr!
        myTel.text = item.UTel!
        myPostcode.text = item.UPostcode!
    }
    


    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var btnWithdrawal: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    
        myEmail.text = Share.userID
        myEmail.isUserInteractionEnabled = false
        secondAnimation()
        
        let mypageModel = myPageModel()
        mypageModel.delegate = self
        mypageModel.checkItems(UserId: myEmail.text!)
        
        myName.text = dsName
        myPostcode.text = dsPostcode
        myTel.text = dsTel
        print("receiveItem\(dsName)")

    }
    
    override func viewWillAppear(_ animated: Bool) {//애니메이션
    super.viewWillAppear(animated)
  //  SearchBar.center.y -= view.bounds.height //위에 숨겨져 있음
    btnWithdrawal.center.y += view.bounds.height //아래에 숨겨져있음
  // hiddenLabel.alpha = 0.0 // 알파0
    }

    func secondAnimation() {
    //animate second label
    UIView.animate(withDuration: 1.8, delay: 0.5, options: [], animations: {
    self.btnWithdrawal.center.y -= self.view.bounds.height
    }, completion:nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func myreceiveItems(_ UPassword: String,_ UName: String, _ UTel: String, _ UPostcode: String, _ UAddr: String){
        dsName = UName
        dsPassword = UPassword
        dsPostcode = UPostcode
        dsTel = UTel
        dsAddr = UAddr
        print("receiveItems dsName:\(dsName)")
    }
    
    // 키보드 숨기기
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
 
        
    @IBAction func btnLogout(_ sender: UIButton) {
        Share.userID = ""
    }
    
}
