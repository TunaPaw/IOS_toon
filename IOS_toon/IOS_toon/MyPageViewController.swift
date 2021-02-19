//
//  MyPageViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/19.
//

import UIKit

class MyPageViewController: UIViewController {


    @IBOutlet weak var btnWithdrawal: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondAnimation()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {//애니메이션
    super.viewWillAppear(animated)
  //  SearchBar.center.y -= view.bounds.height //위에 숨겨져 있음
    btnWithdrawal.center.y += view.bounds.height //아래에 숨겨져있음
  // hiddenLabel.alpha = 0.0 // 알파0
    }

    func secondAnimation() {
    //animate second label
    UIView.animate(withDuration: 2.0, delay: 0.5, options: [], animations: {
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

}
