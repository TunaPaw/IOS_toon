//
//  ContentSelectModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/22.
//

import Foundation

protocol ContentSelectModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class ContentSelectModel{
    var delegate: ContentSelectModelProtocol!
    let urlPath = "http://127.0.0.1:8080/iosproject/MainNewListSelect.jsp"
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
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
            let query = ContentDBModel()
            
            if let CTitle = jsonElement["CTitle"] as? String,
               let CGenre = jsonElement["CGenre"] as? String,
               let CCoverImage = jsonElement["CCoverImage"] as? String{
                query.CTitle = CTitle
                query.CGenre = CGenre
                query.CCoverImage = CCoverImage
                }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
    
}
