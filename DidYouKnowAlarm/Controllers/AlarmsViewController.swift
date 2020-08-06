//
//  AlarmsViewController.swift
//  DidYouKnowAlarm
//
//  Created by Tunde Ola on 8/5/20.
//  Copyright © 2020 Tunde JS. All rights reserved.
//

import UIKit

class AlarmsViewController: UITableViewController {
    
    let alarms: [Alarm] = [
        Alarm(time: Date(), label: "Alarm"),
        Alarm(time: Date(), label: "My Day")
    ]
    
    
    @IBAction func addAlarmHandler(_ sender: UIBarButtonItem) {
        print("Add a new Alarm Item")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelectionDuringEditing = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if alarms.count != 0 {
            self.navigationItem.leftBarButtonItem = editButtonItem
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alarms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Identifier.alarmCellIdentifier)
        
        //not understood yet.
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "alarm")
        }
        
        //cell text
        cell!.selectionStyle = .none
        cell!.tag = indexPath.row
        let alarm: Alarm = alarms[indexPath.row]
        let amAttr: [NSAttributedString.Key : Any] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.systemFont(ofSize: 20.0)]
        let str = NSMutableAttributedString(string: "Queen" , attributes: amAttr)
        cell!.detailTextLabel?.text = alarm.label
        cell!.textLabel?.attributedText = str
        
        //append switch button
        let sw = UISwitch(frame: CGRect())
        sw.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
        
        //tag is used to indicate which row had been touched
        sw.tag = indexPath.row
        sw.addTarget(self, action: #selector(self.switchTapped(_:)), for: UIControl.Event.valueChanged)
//        if alarm.enabled {
            cell!.backgroundColor = UIColor.white
            cell!.textLabel?.alpha = 1.0
            cell!.detailTextLabel?.alpha = 1.0
            sw.setOn(true, animated: false)
//        } else {
//            cell!.backgroundColor = UIColor.groupTableViewBackground
//            cell!.textLabel?.alpha = 0.5
//            cell!.detailTextLabel?.alpha = 0.5
//        }
        cell!.accessoryView = sw
        
        //delete empty seperator line
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
       print("The switch is tapped!!!")
    }
    
}
