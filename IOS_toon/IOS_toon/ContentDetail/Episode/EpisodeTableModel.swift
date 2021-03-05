//
//  EpisodeTableModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import Foundation

protocol EpisodeTableModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class EpisodeTableModel{
    var delegate: EpisodeTableModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosproject/episodeRead.jsp?now=\(Share.nowContentCode)"

    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){ [self](data, response, error)in
            if error != nil{
                print("failed to download data")
            }else{
                print("Data is downloading")
                print("\(urlPath)")
                self.parseJONS(data!)
            }
        }
        task.resume()
    }
    
    func parseJONS(_ data: Data){
        var jasonResult = NSArray()
        
        do {
            jasonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jasonResult.count{
            jsonElement = jasonResult[i] as! NSDictionary
            let query = EpisodeDBModel()
            
            if let ecode = jsonElement["ecode"] as? String,
               let ccode = jsonElement["ccode"] as? String,
               let contentImage1 = jsonElement["contentImage1"] as? String,
               let contentImage2 = jsonElement["contentImage2"] as? String,
               let contentImage3 = jsonElement["contentImage3"] as? String{
                query.Ecode = ecode
                query.Ccode = ccode
                query.EContentImage1 = contentImage1
                query.EContentImage2 = contentImage2
                query.EContentImage3 = contentImage3
            }
            locations.add(query)
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
    
}
