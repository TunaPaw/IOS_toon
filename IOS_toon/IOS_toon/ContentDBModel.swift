//
//  ContentDBModel.swift
//  IOS_toon
//
//  Created by Tuna on 2021/02/22.
//

import Foundation

class ContentDBModel: NSObject {
    
    //properties
    var CCode:String?
    var CTitle:String?
    var CAuthor:String?
    var CGenre:String?
    var CCoverImage:String?
    var CContentImage1:String?
    var CContentImage2:String?
    var Cepisode:String?
    var CSubTitle:String?
    var CViewCount:String?
    var CDeleteDate:String?
    
    //Empty Constructor
    override init(){
        
    }
    
    init(CTitle:String, CGenre:String, CCoverImage:String){
        self.CTitle = CTitle
        self.CGenre = CGenre
        self.CCoverImage = CCoverImage
    }
}
