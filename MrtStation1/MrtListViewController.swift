//
//  MrtListViewController.swift
//  MrtStation1
//
//  Created by Jin Lee on 2016/5/26.
//  Copyright © 2016年 Jin Lee. All rights reserved.
//

import UIKit

class MrtListViewController: UITableViewController {
    
    var titleName = ["文湖線", "淡水信義線", "新北投支線", "松山新店線", "小碧潭支線", "中和新蘆線", "板南線", "貓空纜車"]
    var mrtLineSec: [[Station]] = Stationsource().getSections()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...7
        {
            for j in 0...mrtLineSec[i].count-1
            {
                print(mrtLineSec[i][j].lineName.count)
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return mrtLineSec.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mrtLineSec[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleName[section]
    }
    
    func setLineLabelColor(_ stationLineNumber:String) -> UIColor {
        if stationLineNumber.contains("BR") {
            return UIColor(red: 158/255, green: 101/255, blue: 46/255, alpha: 1)
        } else if stationLineNumber.contains("G") && !stationLineNumber.contains("A") && !stationLineNumber.contains("M") {
            return UIColor(red: 0/255, green: 119/255, blue: 73/255, alpha: 1)
        } else if stationLineNumber.contains("O") {
            return UIColor(red: 255/255, green: 163/255, blue: 0/255, alpha: 1)
        } else if stationLineNumber.contains("B") && !stationLineNumber.contains("R") {
            return UIColor(red: 0/255, green: 94/255, blue: 184/255, alpha: 1)
        } else if stationLineNumber.contains("R") && !stationLineNumber.contains("B") && !stationLineNumber.contains("A"){
            return UIColor(red: 203/255, green: 44/255, blue: 48/255, alpha: 1)
        } else if stationLineNumber.contains("MG") {
            return UIColor(red: 119/255, green: 185/255, blue: 51/255, alpha: 1)
        } else if stationLineNumber.contains("G03A") {
            return UIColor(red: 206/255, green: 220/255, blue: 0/255, alpha: 1)
        } else {
            //            stationLineNumber.containsString("RA")
            return UIColor(red: 248/255, green: 144/255, blue: 165/255, alpha: 1)
        }
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineName.count == 1 {
  //          mrtLineSec[indexPath.section][indexPath.row].lengTH = 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecTableViewCell", for: indexPath) as! SecTableViewCell
            
            cell.nameLabel.text = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].name as String
            cell.firstLineNum.text = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[0] as String
            cell.firstLineNum.backgroundColor = setLineLabelColor(mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[0] as String)
            cell.firstLineNum.textColor = UIColor.white
            cell.secondLineNum.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            cell.firstLineNum.layer.cornerRadius = 3
            cell.secondLineNum.text = ""
         //   cell.secondLineNum.hidden = true
            
            return cell
        } else {
 //           mrtLineSec[indexPath.section][indexPath.row].lengTH = 2
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "SecTableViewCell", for: indexPath) as! SecTableViewCell
            
            cellTwo.nameLabel.text = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].name as String
            cellTwo.firstLineNum.text = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[0] as String
            cellTwo.firstLineNum.backgroundColor = setLineLabelColor(mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[0] as String)
            cellTwo.firstLineNum.textColor = UIColor.white
            cellTwo.secondLineNum.text = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[1] as String
            cellTwo.secondLineNum.backgroundColor = setLineLabelColor(mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum[1] as String)
            cellTwo.secondLineNum.textColor = UIColor.white
            cellTwo.layer.cornerRadius = 3
            cellTwo.firstLineNum.layer.cornerRadius = 3
            cellTwo.secondLineNum.layer.cornerRadius = 3
            return cellTwo
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    if segue.identifier == "showDetail"{
     //   let cell = sender as! SecTableViewCell
        let destinationController = segue.destination as! MrtDetailViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            if mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineNum.count == 1
            {
                destinationController.stationName = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].name
                destinationController.oneLine = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineName[0]
            }
            else
            {
                destinationController.stationName = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].name
                destinationController.twoLineFirst = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineName[0]
                destinationController.twoLineSecond = mrtLineSec[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row].lineName[1]
            }
        }
   //     destinationController.stationNameLabel.text = cell.nameLabel.text!
    //    destinationController.acceptLine = oneLineCell.firstLineNameLabel.text!

        }
    }
}
