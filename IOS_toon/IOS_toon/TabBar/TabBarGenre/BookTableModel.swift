//
//  BookTableModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import Foundation

protocol  BookTableModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class BookTableModel {
    var delegate: BookTableModelProtocol!
    
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
            
            if let ccode = jsonElement["code"] as? String,
               let cauthor = jsonElement["author"] as? String,
               let ccover = jsonElement["cover"] as? String,
               let ctitle = jsonElement["title"] as? String,
               let cgenre = jsonElement["genre"] as? String,
               let cepisode = jsonElement["episode"] as? String,
               let cview = jsonElement["view"] as? String,
               let cinsert = jsonElement["insert"] as? String,
               let cdelete = jsonElement["delete"] as? String,
               let csubtitle = jsonElement["subtitle"] as? String{
                
                query.ccode = ccode
                query.cauthor = cauthor
                query.ccover = ccover
                query.ctitle = ctitle
                query.cgenre = cgenre
                query.cepisode = cepisode
                query.cview = cview
                query.cinsert = cinsert
                query.cdelete = cdelete
                query.csubtitle = csubtitle
        }
            locations.add(query)
    }
        DispatchQueue.main.async(execute: {() ->Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
}
