//
//  MainViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/18.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var AdImageView: UIImageView!
    let timeSelector: Selector = #selector(MainViewController.updateTime)
    let interval = 2.0 // 시간 interval 1초
    var count = 0
    
    var numImage = 0
    var imagName = ["ad8.png", "ad1.png", "ad4.png", "ad5.png", "ad2.png", "ad6.png","ad7.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //년도-월-일 요일 (오전/오후) 시간:분
        
        count += 1
        if count >= imagName.count {
            count = 0
      }
        displayImage(number: count)
        print(count)
    }
   
    
    
    func displayImage(number: Int){
        AdImageView.image = UIImage(named: imagName[number])
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
