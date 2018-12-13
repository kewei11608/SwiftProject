//
//  AFNModel.swift
//  YiJiuClassRoom
//
//  Created by lidan on 2018/12/4.
//  Copyright © 2018 mac-lulu. All rights reserved.
//

import Foundation
struct AFNModel: Codable {
    var code: TStrInt
    var data: DMData
    
    struct DMData: Codable {
        var stateCode: TStrInt
        var redPacketsSwitch: String
        var turnTableSwitch: String

        var gamelist: DMReturnData?
    }
    
    struct DMReturnData: Codable {
        var gamelist: [DMRankingList]?
    }
    
    struct DMRankingList: Codable {
        var betTime: String
        var img: String
        var openTime: String
        var subtitle: String
        var type: TStrInt
        var title: String
    }
}
