//
//  TestModel.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/11/28.
//  Copyright © 2018 mac-lulu. All rights reserved.
//

import Foundation
import HandyJSON

class TestModel:EVObject {
    var betTime:String = ""
    var img:String?
    var openTime:String = ""
    //真是照片
    var subtitle:String = ""
    //推荐人姓名
    var title:String?
    //事业部ID
    var type:String?
    
    
//    init(dict: [String: AnyObject]) {
//        id = dict["id"] as? Int
//        name = dict["name"] as? String
//        favorites_count = dict["favorites_count"] as? Int
//        price = dict["price"] as? String
//        liked = dict["liked"] as? Bool
//        cover_image_url = dict["cover_image_url"] as? String
//        describe = dict["description"] as? String/
    
    
    
//    
//    //自定义构造函数
//    init(dic:[String:AnyObject]) {
//        super.init()
//        //模型一键赋值这个其实是运用了kvc的原理
//        self.setValuesForKeys(dic)
//    }
//    
//    public required init() {
//        fatalError("init() has not been implemented")
//    }
//    
//    //如果字典里面的key在model里没有的话，不用此方法则会报错
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        
//    }
//    
//    
    
}
