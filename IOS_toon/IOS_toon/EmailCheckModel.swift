//
//  EmailCheckModel.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/22.
//

import Foundation

protocol JspModelProtocol: class {
    
    func itemDownloaded(items: String)
}


class EmailCheckModel{
    

    var delegate: JspModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosproject/emailCheck.jsp"
    func checkItems(Email: String){
    let urlAdd = "?Email=\(Email)"
    urlPath = urlPath + urlAdd
        print("urlpath\(urlPath)")
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
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
        var count: String = ""
        for i in 0..<jsonResult.count{
            jsonElement =  jsonResult[i] as! NSDictionary

            if let countresult = jsonElement["count"] as? String{
                locations.add(countresult)
                
                count = locations[0] as! String
            }

        }
       
        
        
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate?.itemDownloaded(items: count)
            print("이메일체크모델\(count)")
            
        })
    }

}
