//
//  MrtDetailViewController.swift
//  MrtStation1
//
//  Created by Jin Lee on 2016/5/26.
//  Copyright © 2016年 Jin Lee. All rights reserved.
//

import UIKit

class MrtDetailViewController: UIViewController {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    
    @IBOutlet weak var twoLineLabelO: UILabel!
    @IBOutlet weak var twoLineLabelT: UILabel!
    
    var stationName = String()
    var oneLine : String = ""
    var twoLineFirst = String()
    var twoLineSecond = String()
    
    func setLineLabelColor(_ stationLineName:String) -> UIColor {
        if stationLineName.contains("文湖") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if stationLineName.contains("松山新店") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if stationLineName.contains("中和新蘆") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if stationLineName.contains("板南") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if stationLineName.contains("淡水信義") {
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if stationLineName.contains("貓空") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if stationLineName.contains("小碧潭") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else {
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stationNameLabel.text = stationName
        self.navigationItem.title = stationName
        if oneLine != ""{
            lineLabel.text = oneLine
            lineLabel.backgroundColor = setLineLabelColor(oneLine)
            lineLabel.textColor = UIColor.white
        }
        else {
            twoLineLabelO.text = twoLineFirst
            twoLineLabelT.text = twoLineSecond
            twoLineLabelO.backgroundColor = setLineLabelColor(twoLineFirst)
            twoLineLabelT.backgroundColor = setLineLabelColor(twoLineSecond)
            twoLineLabelO.textColor = UIColor.white
            twoLineLabelT.textColor = UIColor.white
            //print(StationLineC)
        }
        
    }
    
    
}
