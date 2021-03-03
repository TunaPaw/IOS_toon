//
//  ReviewTableModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import Foundation

protocol  ReviewTableModelProtocol: class {
    func itemDownloaded(items: NSArray)
    }
    
class ReviewTableModel {
    var delegate: ReviewTableModelProtocol!
    let urlPath = "http://127.0.0.1:8080/iosproject/ReviewRead.jsp"
    
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
        func parseJONS(_ data: Data)  {
            var jsonResult = NSArray()
            
            do{
                jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)as! NSArray
                
            }catch let error as NSError{
                print(error)
            }
            
            var jsonElement = NSDictionary()
            let locations = NSMutableArray()
            
            for i in 0..<jsonResult.count{
                jsonElement =  jsonResult[i] as! NSDictionary
                let query = ReviewDBModel()
                
                if let rcode = jsonElement["rcode"] as? String,
                   let ccode = jsonElement["ccode"] as? String,
                   let uemail = jsonElement["uemail"] as? String,
                   let rcontent = jsonElement["rcontent"] as? String,
                   let rinsert = jsonElement["rinsert"] as? String,
                   let rdelete = jsonElement["rdelete"] as? String{
                    query.Rcode = rcode
                    query.Ccode = ccode
                    query.Uemail = uemail
                    query.Rcontent = rcontent
                    query.RInsertDate = rinsert
                    query.RDeleteDate = rdelete
                }
                locations.add(query)
            }
            DispatchQueue.main.async(execute: {() -> Void in
                self.delegate.itemDownloaded(items: locations)
            })
        }

}
