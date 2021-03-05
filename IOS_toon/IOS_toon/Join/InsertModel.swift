//
//  InsertModel.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/22.
//

import Foundation
class InsertModel: NSObject{
var urlPath = "http://127.0.0.1:8080/iosproject/join.jsp"

    func insertItems(Email: String, Name: String, Tel:String, Postcode:String, Addr:String, Password:String, PasswordCheck:String) -> Bool{
    var result: Bool = true
    let urlAdd = "?Email=\(Email)&Name=\(Name)&Tel=\(Tel)&Postcode=\(Postcode)&Addr=\(Addr)&Password=\(Password)&PasswordCheck=\(PasswordCheck)"
    urlPath = urlPath + urlAdd
    
    //한글 url encoding
    urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    
    let url: URL = URL(string: urlPath)!
    let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
    
    let task = defaultSession.dataTask(with: url){(data, response, error) in
        if error != nil{
            print("Failed to insert data")
            result = false
        }else{
            print("Data is inserted!")
            result = true
        }
    }
    task.resume()
    return result
}
}
