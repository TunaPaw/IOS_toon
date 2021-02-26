//
//  FavoriteTableModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import Foundation

protocol FavoriteTableModelProtocol: class {
    func itemDownloaded(items:NSArray)
    }
    
    class FavoriteTableModel: NSObject {
        var delegate: FavoriteTableModelProtocol!
        let urlPath = "http://127.0.0.1:8080/iosproject/favoriteRead.jsp"
        
        func downloadItems(){
            let url = URL(string: urlPath)!
            let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
            
            let task = defaultSession.dataTask(with: url){(data, responds, error)in if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloading")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
        func parseJSON(_ data: Data){
            var jsonResult = NSArray()
            
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            }catch let error as NSError{
                print(error)
            }
            
            var jsonElement = NSDictionary()
            let locations = NSMutableArray()
            
            for i in 0..<jsonResult.count{
                jsonElement = jsonResult[i] as! NSDictionary
            
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"]as? String,
               let sdept = jsonElement["dept"]as? String,
               let sphone = jsonElement["phone"]as? String{
                let query = ContentDBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                
                locations.add(query)
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
        self.delegate.itemDownloaded(items: locations)
        })
    }
}
