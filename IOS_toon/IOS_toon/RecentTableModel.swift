//
//  RecentTableModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import Foundation

protocol RecentTableModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class RecentTableModel {
    var delegate: RecentTableModelProtocol!
    let urlPath = "http://127.0.0.1:8080/iosproject/recentRead.jsp"

    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, reponse, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                self.parseJONS(data!)
            }
        }
        task.resume()
    }
    func parseJONS(_ data:Data){
        var jasonResult = NSArray()
        
        do{
            jasonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jasonResult.count{
            jsonElement = jasonResult[i] as! NSDictionary
            let query = ContentDBModel()
            
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                query.scode = scode
                query.sname = sname
                query.sdept = sdept
                query.sphone = sphone
        }
            locations.add(query)
    }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
}
