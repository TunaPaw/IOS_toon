//
//  TestDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/26.
//

import Foundation



class TestDBModel: NSObject {
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

}
