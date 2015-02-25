//
//  MainTableViewController.swift
//  MidtermSwift
//
//  Created by 佐藤麻央 on 2015/02/20.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var sections = ["Cell Style Example", "Edit Table Example"]
    var styles = ["Style","Accessory", "Separator","Customized"]
    var functions = ["Add, Delete and Edit"]
    var content: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //return the number of section
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return sections.count
    }
    
    // returns hedding of sections
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // returns
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return styles.count
        }else{
            return functions.count
        }
    }
    
    // sets the content of cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        if indexPath.section == 0{
            cell.textLabel?.text = styles[indexPath.row]
        }else{
            cell.textLabel?.text = functions[indexPath.row]
        }
        return cell
    }
    
    // gets the content on cell and calls segue to go next page when a cell is selected
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // set the contetnt of the cell to variable and call segue to go to the next view
        content = styles[indexPath.row]
        if indexPath.section == 0 {
            if(indexPath.row == styles.count - 1){
                performSegueWithIdentifier("toCust",sender: nil)
            }else{
                performSegueWithIdentifier("toStyle",sender: nil)
            }
        }else{
            if(indexPath.row == 0){
                performSegueWithIdentifier("toAdd",sender: nil)
            }
        }
    }
    
    
    // Prepare segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toStyle") {
            let styleTable: StyleTableViewController = segue.destinationViewController as StyleTableViewController
            styleTable.style = content
        }
    }

}
