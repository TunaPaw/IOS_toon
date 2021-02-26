//
//  FavoriteDetailViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/25.
//

import UIKit

class FavoriteDetailViewController: UIViewController {

    
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
    }
    
    
    func receiveItems(_ id: String, _ name: String, _ dept: String, _ phone: String){
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
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
