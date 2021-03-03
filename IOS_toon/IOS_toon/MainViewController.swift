//
//  MainViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/18.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var PopCollection: UICollectionView!
    @IBOutlet weak var adPage: UIPageControl!
    @IBOutlet weak var AdImageView: UIImageView!
    let timeSelector: Selector = #selector(MainViewController.updateTime)
    let interval = 2.0 // 시간 interval 1초
    var count = 0
    
    var numImage = 0
    var imagName = ["ad8.png", "ad1.png", "ad4.png", "ad5.png", "ad2.png", "ad6.png","ad7.png"]
    
    let numberofTouches = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)
        
        //페이징
        adPage.numberOfPages = imagName.count
        adPage.currentPage = 0
        adPage.pageIndicatorTintColor = UIColor.white
        adPage.currentPageIndicatorTintColor  = UIColor.gray
        AdImageView.image = UIImage(named: imagName[0])
        // 한 손가락 Guesture
                // 오른쪽
                let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.responseToSwipeGesture(_ :)))
                swipeRight.direction = UISwipeGestureRecognizer.Direction.right
                self.view.addGestureRecognizer(swipeRight)

                // 왼쪽
                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.responseToSwipeGesture(_:)))
                swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
                self.view.addGestureRecognizer(swipeLeft)
    }
    // 한 손가락 Guesture
       @objc func responseToSwipeGesture(_ gesture: UISwipeGestureRecognizer){
           if let swipeGesture = gesture as? UISwipeGestureRecognizer{
               // 발생한 이벤트가 각 방향의 스와이프 이벤트라면
               // pageControl이 가르키는 현재 페이지에 해당하는 이미지를 imageView에 할당
           switch swipeGesture.direction{
               case UISwipeGestureRecognizer.Direction.right:
               adPage.currentPage -= 1
               AdImageView.image = UIImage(named: imagName[adPage.currentPage])
           case UISwipeGestureRecognizer.Direction.left:
               adPage.currentPage += 1
               AdImageView.image = UIImage(named: imagName[adPage.currentPage])
               default:
                   break
               }
           }
       }
    
    
    @IBAction func imageControll(_ sender: UIPageControl) {
        AdImageView.image = UIImage(named: imagName[adPage.currentPage])
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
