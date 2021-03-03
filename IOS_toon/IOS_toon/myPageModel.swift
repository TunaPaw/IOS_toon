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
                locations.add(query)
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        print(locations)
        })
    }

}

