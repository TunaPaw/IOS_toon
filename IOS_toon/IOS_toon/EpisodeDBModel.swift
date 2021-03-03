//
//  EpisodeDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/26.
//

import Foundation

class EpisodeDBModel: NSObject {

var Ecode :String?
var Ccode :String?
var Eepisode :String?
var EContentImage1 :String?
var EContentImage2 :String?
var EContentImage3 :String?


    override init(){
        
    }

    init(Ecode: String, Ccode: String, Eepisode: String, EContentImage1: String, EContentImage2: String, EContentImage3: String){
        self.Ecode = Ecode
        self.Ccode = Ccode
        self.EContentImage1 = EContentImage1
        self.EContentImage2 = EContentImage2
        self.EContentImage3 = EContentImage3
    }
    
    init(EContentImage1: String, EContentImage2: String, EContentImage3: String){
        self.EContentImage1 = EContentImage1
        self.EContentImage2 = EContentImage2
        self.EContentImage3 = EContentImage3
    }
}

