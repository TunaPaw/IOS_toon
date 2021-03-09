//
//  ContentDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/24.
//

import Foundation

class ContentDBModel: NSObject {
    
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    
    var ccode :String?
    var cauthor :String?
    var ccover :String?
    var ctitle :String?
    var cgenre :String?
    var cepisode :String?
    var cview :String?
    var cinsert :String?
    var cdelete :String?
    var csubtitle :String?
    


    override init(){
        
    }

    init(scode: String, sname: String, sdept: String, sphone: String){
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
    init(ccode :String, cauthor :String, ccover :String, ctitle :String, cgenre :String, cepisode :String,  cview :String, cinsert :String, cdelete :String, csubtitle :String){
        
        self.ccode = ccode
        self.cauthor = cauthor
        self.ccover = ccover
        self.ctitle = ctitle
        self.cgenre = cgenre
        self.cepisode = cepisode
        self.cview = cview
        self.cinsert = cinsert
        self.cdelete = cdelete
        self.csubtitle = csubtitle
        }
    
    init(ccover: String, ctitle: String){
        self.ccover = ccover
        self.ctitle = ctitle
    }
}
