//
//  myPageModel.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/03/03.
//

import Foundation

protocol myPageModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class myPageModel{
    var delegate: myPageModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosproject/user_query_ios.jsp"
    
    func checkItems(UserId: String){
    let urlAdd = "?UEmail=\(UserId)"
    urlPath = urlPath + urlAdd
        print("urlpath\(urlPath)")
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("userinfo is downloading")
                self.parseJONS(data!)
            }
        }
        task.resume()
    }
    
    var Uname : String = ""
        
    func parseJONS(_ data: Data){
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary
            let query = DBModel()
            
            if let UPassword = jsonElement["UPassword"] as? String,
               let UName = jsonElement["UName"] as? String,
               let UTel = jsonElement["UTel"] as? String,
               let UPostcode = jsonElement["UPostcode"] as? String,
               let UAddr = jsonElement["UAddr"] as? String{
                
                query.UPassword = UPassword
                query.UName = UName
                query.UTel = UTel
                query.UPostcode = UPostcode
                query.UAddr = UAddr
                print("parsing:\(UName)")
                
                Uname = query.UName!
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        print("mypageModel:\(locations)")
        })
        
    }
}

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "myPageSegue"{
//            let myPageView = segue.destination as! MyPageViewController
//
//            // let item: Students = studentsList[(indexPath! as NSIndexPath).row]
//            let item: DBModel = DBModel.init() // NSIndexPath 생략가능
//
//            let UPassword = item.UPassword
//            let UName = item.UName
//            let UTel = item.UTel
//            let UPostcode = item.UPostcode
//            let UAddr = item.UAddr
//
//            myPageView.receiveItems(UPassword:UPassword, UName: UName, UTel: UTel, UPostcode: UPostcode, UAddr:UAddr)
//            print("mainView\(String(describing: UName))")
//        }

