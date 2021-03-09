//
//  CreateViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/03/10.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var choice: UISegmentedControl!
    @IBOutlet weak var NovelView: UIView!
    @IBOutlet weak var ToonView: UIView!
    
    @IBOutlet weak var txt: UITextView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var imgBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Choice(_ sender: Any) {
        if choice.selectedSegmentIndex == 0{
            
            self.NovelView.isHidden = true
            self.ToonView.isHidden = false
            
        }else if choice.selectedSegmentIndex == 1{
      
            self.NovelView.isHidden = false
            self.ToonView.isHidden = true
            
        
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
