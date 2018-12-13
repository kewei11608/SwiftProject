//
//  GameMoel.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/12/5.
//  Copyright © 2018 mac-lulu. All rights reserved.
//

import Foundation
class GameMoel:NSObject {
    var betTime:String?
    var img:String?
    var openTime:String?
    //真是照片
    var subtitle:String?
    //推荐人姓名
    var title:String?
    //事业部ID
    var type:String?
    
    //
        //自定义构造函数
        init(dic:[String:AnyObject]) {
            super.init()
            //模型一键赋值这个其实是运用了kvc的原理
            self.setValuesForKeys(dic)
        }
    
    public required override init() {
            fatalError("init() has not been implemented")
        }
    
        //如果字典里面的key在model里没有的话，不用此方法则会报错
        override func setValue(_ value: Any?, forUndefinedKey key: String) {
    
        }
    //
//        init(dict: [String: AnyObject]) {
//            betTime = dict["betTime"] as? String
//            img = dict["img"] as? String
//            openTime = dict["openTime"] as? String
//            subtitle = dict["subtitle"] as? String
//            title = dict["title"] as? String
//            type = dict["type"] as? String
//
//
//
//    }

    
    
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
