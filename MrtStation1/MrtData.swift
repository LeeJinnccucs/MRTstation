//
//  MrtData.swift
//  MrtStation1
//
//  Created by Jin Lee on 2016/5/26.
//  Copyright © 2016年 Jin Lee. All rights reserved.
//

import Foundation

struct Station {
    var name: String
    var lineName: [String]
    var lineNum: [String]
    
    init(title: String, lineNo: [String], lineNa: [String]) {
        name = title
        lineNum = lineNo
        lineName = lineNa
    }
}
