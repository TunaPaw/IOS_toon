//
//  ReviewDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/27.
//

import Foundation

class ReviewDBModel: NSObject {

var Rcode :String?
var Ccode :String?
var Uemail :String?
var Rcontent :String?
var RInsertDate :String?
var RDeleteDate :String?


    override init(){
        
    }

    init(Rcode: String, Ccode: String, UEmail: String, Rcontent: String, Rinsertdate: String, Rdeletedate: String){
        self.Rcode = Rcode
        self.Ccode = Ccode
        self.Uemail = UEmail
        self.Rcontent = Rcontent
        self.RInsertDate = Rinsertdate
        self.RDeleteDate = Rdeletedate
    }
    
}
