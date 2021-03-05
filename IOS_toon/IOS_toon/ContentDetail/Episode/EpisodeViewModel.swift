//
//  EpisodeViewModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import Foundation

protocol EpisodeViewModelProtocol: class {
    func itemDownloaded(items: String)
}


class EpisodeViewModel{
    
    var ccode: String = Share.nowContentCode
    var ecode: String = Share.nowEcode
    
    var delegate: EpisodeViewModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosproject/episodeViewRead.jsp?ccode=\(Share.nowContentCode)&ecode=\(Share.nowEcode)"
    
    func downloadItems(){
        
        print("다운로드\(Share.nowContentCode),\(Share.nowEcode)")
        print("다운로드\(urlPath)")
        
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
        var jasonResult = NSArray()
        
        do {
            jasonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        var contentImage: String = ""
        
        for i in 0..<jasonResult.count{
            jsonElement = jasonResult[i] as! NSDictionary
            
            if let contentImage1 = jsonElement["contentImage1"] as? String{
               
                locations.add(contentImage1)
                contentImage = locations[0] as! String
                
                
            }
           
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: contentImage)
        })
    }
 
    
}
