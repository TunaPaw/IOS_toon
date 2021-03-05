//
//  MainViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/18.
//

import UIKit

class MainViewController: UIViewController{
    
    var feedItem1: NSArray = NSArray()
    var feedItem2: NSArray = NSArray()
    

    
    var imgurl2: String = ""
    
    @IBOutlet weak var NewCollection: UICollectionView!
    @IBOutlet weak var PopCollection: UICollectionView!
    
    @IBOutlet weak var adPage: UIPageControl!
    @IBOutlet weak var AdImageView: UIImageView!
    
    
    let timeSelector: Selector = #selector(MainViewController.updateTime)
    let interval = 2.0 // 시간 interval 1초
    var count = 0
    
    var numImage = 0
    var imagName = ["ad8.png", "ad1.png", "ad4.png", "ad5.png", "ad2.png", "ad6.png","ad7.png"]
    
    
    var list = ["1", "2", "3", "4" ,"5", "6", "7", "8", "9", "10","1", "2", "3", "4" ,"5", "6", "7", "8", "9", "10"]
    
    
    let numberofTouches = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)
    
        
//        self.NewCollection.delegate = self
//        self.NewCollection.dataSource = self
        
        
        //PopCollection.delegate = self
        PopCollection.dataSource = self
        
        NewCollection.reloadData()
        PopCollection.reloadData()
       
        
        //페이징-------------------------------------------------------
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
    }// AD section에 이미지 부여
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //년도-월-일 요일 (오전/오후) 시간:분
        count += 1
        if count >= imagName.count {
            count = 0
      }
        displayImage(number: count)
    }//AD 자동변경
   
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

//POP Collection data------------
extension MainViewController:  UICollectionViewDataSource, MainPopCollectionModelProtocol {
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return list.count
        return feedItem2.count
    }
    
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopCell", for: indexPath) as! MainPopCollectionViewCell
        
        let item: ContentDBModel = feedItem2[indexPath.row] as! ContentDBModel
        cell.lbTitle?.text = "\(String(describing: item.ctitle))"
        cell.wbCover?.load(URLRequest(url: URL(string: "\(String(describing: item.ccover))")!))
        
        cell.lbTitle.text = list[indexPath.row]
        //cell.RwbImage?.load(URLRequest(url: URL(string: "\(imageurl)")!))
        cell.wbCover?.load(URLRequest(url: URL(string: "http://toonimage.angle777899.com/small/8059.jpg")!))

        return cell
    }
    
    
    func itemDownloaded(items: NSArray) {
        feedItem2 = items
        self.PopCollection.reloadData()
    }
    
}
    
    

//    extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
//
//            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//                return list.count
//            }
//            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as! MainNewCollectionViewCell
//
//                cell.lbNew.text = list[indexPath.row]
//                cell.wbNew?.load(URLRequest(url: URL(string: "http://toonimage.angle777899.com/small/8059.jpg")!))
//
//                return cell
//            }
//
//    }

//}
//extension MainViewController :  UICollectionViewDelegateFlowlayout{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//
//        if let message = message?[indexPath.item].text {
//            let size = CGSize(width: self.view.frame.width,  height:1000)
//            let options = NsStringDrawingOPtions.UserFontLeading.union( .userLineFrag)
//        }
//    }
//}