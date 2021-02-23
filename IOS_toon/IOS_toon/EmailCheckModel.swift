//
//  EmailCheckModel.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/22.
//

import Foundation

protocol JspModelProtocol: class {
    func itemDownloaded(items: NSArray)
}

class EmailCheckModel{
    
    var count: Int = 0
    var delegate: JspModelProtocol!
    var urlPath = "http://127.0.0.1:8080/iosproject/emailCheck.jsp"
    func checkItems(Email: String){
    let urlAdd = "?Email=\(Email)"
    urlPath = urlPath + urlAdd
        
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
        if let data = contents.data(using: .utf-8) {
            let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            persons = json
        }
        var countArr = [String]()
        
        if let user_info = user_infos["user_info"] as? [[String: Any]]{

            for personIndex in user_infos {

                countArr.append(personIndex["name"] as! String)

            }

        }



        
        
        
    }
}
