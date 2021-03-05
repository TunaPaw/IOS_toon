//
//  FindViewController.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/18.
//

import UIKit

class FindViewController: UIViewController {

    @IBOutlet weak var findChoice: UISegmentedControl!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var txtId: UITextField!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
