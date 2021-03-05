//
//  FindViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/18.
//

import UIKit

class FindViewController: UIViewController, findPwModelProtocol {

    

    @IBOutlet weak var findChoice: UISegmentedControl!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    var findPW: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblId.isHidden = true
        txtId.isHidden = true
        
    }
    
    @IBAction func Findchoice(_ sender: UISegmentedControl) {
 
            if findChoice.selectedSegmentIndex == 0{
                lblId.isHidden = true
                txtId.isHidden = true
                
            }else if findChoice.selectedSegmentIndex == 1{
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
    }
    func itemDownloaded(items: String) {
        findPW = items
        print("findPw: \(findPW)")
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
