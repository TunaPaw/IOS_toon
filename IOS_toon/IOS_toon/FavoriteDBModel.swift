//
//  FavoriteDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import Foundation

class FavoriteDBModel: NSObject {
    
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    


    override init(){
        
    }

    init(scode: String, sname: String, sdept: String, sphone: String){
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }

}
