//
//  MainViewController.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/18.
//

import UIKit

class MainViewController: UIViewController, ContentSelectModelProtocol {

    @IBOutlet weak var AdImageView: UIImageView!
    @IBOutlet weak var NewScrollView: UIScrollView!
    @IBOutlet weak var FamScrollView: UIScrollView!
    
    
    var feedItem: NSArray = NSArray()
    
    let timeSelector: Selector = #selector(MainViewController.updateTime)
    let interval = 2.0 // 시간 interval 1초
    var count = 0
    var numImage = 0
    var imagName = ["ad8.png", "ad1.png", "ad4.png", "ad5.png", "ad2.png", "ad6.png","ad7.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)//광고 이미지뷰
        
        let contentSelectModel = ContentSelectModel()
        contentSelectModel.delegate = self
        contentSelectModel.downloadItems()
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

    func itemDownloaded(items:NSArray)  {
        feedItem = items
        self.NewScrollView.reloadInputViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        let queryModel = ContentSelectModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }
    
    override func numberOfSections(in NewScrollView: UIScrollView) -> Int{
        return 1
    }
    
    override func NewScrollView(_ NewScrollView: UIScrollView, numberOfRowsInSection section: Int) -> Int{
        return feedItem.count
    }
    
    override func NewScrollView(_ NewScrollVIew: UIScrollView, cellForRowAt indexPath:IndexPath)-> UIScrollView{
        let Cell = NewScrollView.deque
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "sgDetail"{
//            let cell = sender as! UITableViewCell
//            let indexPath = self.NewScrollView.indexPath(for: cell)
//            let detailView = segue.destination as! MainViewController
//
//            //let item: Students =  studentsList[(indexPath! as NSIndexPath).row]
//            let item: ContentDBModel = feedItem[(indexPath!.row)] as! ContentDBModel
//
//            let CTitle = item.CTitle!
//            let CGenre = item.CGenre!
//            let CCoverImage = item.CCoverImage!
//
//            detailView.receiveItems(CTitle, CGenre, CCoverImage)
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


