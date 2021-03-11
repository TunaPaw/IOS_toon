//
//  MainViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/18.
//

import UIKit

class MainViewController: UIViewController{
    
    // MARK: - Properties
    
    /// Tracks the currently centered cell.
    var selectedIndex = 0
    var selectedCell: MainPopCollectionViewCell!
    /// Tracks whether the carousel is inMotion.
    var inMotion = false
    /// Changes the color of the status bar.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var PopCollection: UICollectionView!
    
    @IBOutlet weak var adPage: UIPageControl!
    @IBOutlet weak var AdImageView: UIImageView!
    
    
    let timeSelector: Selector = #selector(MainViewController.updateTime)
    let interval = 2.0 // 시간 interval 1초
    var count = 0
    
    var numImage = 0
    var imagName = ["ad1.png", "ad11.png","ad12.png","ad4.png", "ad5.png", "ad2.png", "ad8.png"]
    
    
    let numberofTouches = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)
    
        
        
        //PopCollection.dataSource = self
        PopCollection.dataSource = self
        PopCollection.delegate = self
        PopCollection.reloadData()
        // Buttons control scroll.
        //PopCollection.isUserInteractionEnabled = false
        
        // Could add swipe gestures instead of buttons here.
       
        
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

    //-------------ad 이미지----------
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
    }//AD 시간차 변경
   
    func displayImage(number: Int){
        AdImageView.image = UIImage(named: imagName[number])
    }//Ad 이미지 표시
    
//    /// Updates selectedIndex and then scrolls to it.
//    @IBAction func scrollButtonTapped(_ sender: UIButton) {
//        guard !inMotion else { return }
//        inMotion = true
//        selectedCell.isInBackground = true
//        if sender.tag == 0 { // LEFT
//            selectedIndex = selectedIndex > 0 ? selectedIndex : Cards.colors.count // prevents scroll out of bounds
//            selectedIndex -= 1
//            let indexPath = IndexPath(row: selectedIndex, section: 0)
//            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        } else { // RIGHT
//            selectedIndex = selectedIndex < Cards.colors.count - 1 ? selectedIndex : -1 // prevents scroll out of bounds
//            selectedIndex += 1
//            let indexPath = IndexPath(row: selectedIndex, section: 0)
//            carouselCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//        }
//    }
    
}

//POP Collection data------------
extension MainViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Cards.colors.count
    }
    
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopCell", for: indexPath) as! MainPopCollectionViewCell
        //cell.lbTitle.text = "보노보노"
       cell.wbCover?.load(URLRequest(url: URL(string: "http://image.yes24.com/momo/TopCate1865/MidCate003/186421229.jpg")!))
    cell.layer.cornerRadius = 12
    cell.backgroundColor = Cards.colors[indexPath.row]
    if indexPath.row == 0 { selectedCell = cell }
    cell.isInBackground = true
        return cell
    }

    
    // Changes cell size to take up most of the screen.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width * 0.75
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    // Enlarges the selected cell after didEndScrolling.
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let indexPath = IndexPath(row: selectedIndex, section: 0)
        selectedCell = PopCollection.cellForItem(at: indexPath) as? MainPopCollectionViewCell
        selectedCell.isInBackground = false
        inMotion = false
    }
     
}

// MARK: - PseudoModel/Controller.
enum Cards {
    static let colors: [UIColor] = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
}

