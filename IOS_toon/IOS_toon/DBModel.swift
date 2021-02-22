//
//  DBModel.swift
//  IOS_toon
//
//  Created by YOUNG on 2021/02/22.
//

import Foundation

class DBModel: NSObject{
    
    var UEmail: String?
    var UName: String?
    var UTel: String?
    var UPostcode: String?
    var UAddr: String?
    var UPassword: String?
    var UPasswordCheck: String?
    
    override init() {
        
    }
    init(UEmail: String, UName: String, UTel: String, UPostcode:String, UAddr: String, UPassword: String, UPasswordCheck: String) {
        self.UEmail = UEmail
        self.UName = UName
        self.UTel = UTel
        self.UPostcode = UPostcode
        self.UAddr = UAddr
        self.UPassword = UPassword
        self.UPasswordCheck = UPasswordCheck
    }
}
