//
//  MrtDataArrange.swift
//  MrtStation1
//
//  Created by Jin Lee on 2016/5/26.
//  Copyright © 2016年 Jin Lee. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Stationsource {
    
    func getSections() -> [[Station]]{
        let path : String = Bundle.main.path(forResource: "MRT", ofType: "json") as String!
        let jsonData = (try? Data(contentsOf: URL(fileURLWithPath: path))) as Data!
        let json = JSON(data: jsonData!)
        
        print(json.count)
        
        var wenhuLine : [Station] = []
        var tanshuiShinyiLine = [Station]()
        var newBeitouLine = [Station]()
        var songshanShindianLine = [Station]()
        var smallBitanLine = [Station]()
        var zhongheShinluLine = [Station]()
        var banNanLine = [Station]()
        var maouKongLine = [Station]()
        
        var wCount = 0
        var tCount = 0
        var nCount = 0
        var sCount = 0
        var smCount = 0
        var zCount = 0
        var bCount = 0
        var mCount = 0
        
        let initStation = Station(title: "", lineNo: [], lineNa: [])
        
        for i in 0...json.count-1{
          //  print(json[0]["name"])
            print(i)
            let name = json[i]["name"].stringValue
            let lineName = json[i]["lines"].map({ (x:(String, JSON)) -> String in x.0 })
            let lineNum = json[i]["lines"].map({ (x:(String, JSON)) -> String in x.1.stringValue })
            
            print(name)
            print(lineName)
            print(lineNum)
            if lineName.contains("文湖線") {
                wenhuLine.append(initStation)
                wenhuLine[wCount].name = name
                wenhuLine[wCount].lineName = lineName
                wenhuLine[wCount].lineNum = lineNum
                wCount += 1
            }
            if lineName.contains("淡水信義線") {
                tanshuiShinyiLine.append(initStation)
                tanshuiShinyiLine[tCount].name = name
                tanshuiShinyiLine[tCount].lineName = lineName
                tanshuiShinyiLine[tCount].lineNum = lineNum
                tCount += 1
            }
            if lineName.contains("新北投支線") {
                newBeitouLine.append(initStation)
                newBeitouLine[nCount].name = name
                newBeitouLine[nCount].lineName = lineName
                newBeitouLine[nCount].lineNum = lineNum
                nCount += 1
            }
            
            if lineName.contains("松山新店線") {
                songshanShindianLine.append(initStation)
                songshanShindianLine[sCount].name = name
                songshanShindianLine[sCount].lineName = lineName
                songshanShindianLine[sCount].lineNum = lineNum
                sCount += 1
            }
            
            if lineName.contains("小碧潭支線") {
                smallBitanLine.append(initStation)
                smallBitanLine[smCount].name = name
                smallBitanLine[smCount].lineName = lineName
                smallBitanLine[smCount].lineNum = lineNum
                smCount += 1
            }
            
            if lineName.contains("中和新蘆線") {
                zhongheShinluLine.append(initStation)
                zhongheShinluLine[zCount].name = name
                zhongheShinluLine[zCount].lineName = lineName
                zhongheShinluLine[zCount].lineNum = lineNum
                zCount += 1
            }
            
            if lineName.contains("板南線") {
                banNanLine.append(initStation)
                banNanLine[bCount].name = name
                banNanLine[bCount].lineName = lineName
                banNanLine[bCount].lineNum = lineNum
                bCount += 1
            }
            
            if lineName.contains("貓空纜車") {
                maouKongLine.append(initStation)
                maouKongLine[mCount].name = name
                maouKongLine[mCount].lineName = lineName
                maouKongLine[mCount].lineNum = lineNum
                mCount += 1
            }
            
        }
        var sectionBigArr = [[Station]]()
        
        sectionBigArr.append(wenhuLine)
        sectionBigArr.append(tanshuiShinyiLine)
        sectionBigArr.append(newBeitouLine)
        sectionBigArr.append(songshanShindianLine)
        sectionBigArr.append(smallBitanLine)
        sectionBigArr.append(zhongheShinluLine)
        sectionBigArr.append(banNanLine)
        sectionBigArr.append(maouKongLine)
        
        
        return sectionBigArr
    }
    
    
}
