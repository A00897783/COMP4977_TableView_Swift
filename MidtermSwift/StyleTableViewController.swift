//
//  StyleTableViewController.swift
//  MidtermSwift
//
//  Created by 佐藤麻央 on 2015/02/19.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

import UIKit

class StyleTableViewController: UITableViewController {

    var style: String?
    var separator : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = style
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    // Return the number of sections.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        return 1
    }

    // Return the number of rows in the section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num : Int = 0;
        if(style == "Style"){
            num = styles.count
        }else if (style == "Accessory"){
            num =  accessories.count
        }else if (style == "Separator"){
             num =  separators.count
        }
        return num
    }
    
    
    var styles = ["Default", "Value1","Value2", "Subtitle"]
    var accessories = ["None","Disclosure Indicator", "Detail Disclosure Button","Checkmark", "Detail Button"]
    var separators = ["None", "Single Line", "Single Line Etched"]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if(style == "Style"){
            cell = setStyle(indexPath)
        }else if(style == "Accessory"){
            cell = setAccessory(indexPath)
        }else if(style == "Separator"){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
            cell.textLabel?.text = separators[indexPath.row]
        }else{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        return cell
    }
    
    func setStyle (indexPath: NSIndexPath)->UITableViewCell{
    var cell: UITableViewCell
        switch(indexPath.row){
        case 0: cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "default")
        case 1: cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "value1")
        case 2: cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: "value2")
        case 3: cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "subtitle")
        default: cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "default")
    }
    cell.textLabel?.text = styles[indexPath.row]
    cell.detailTextLabel?.text = "detail"
    return cell
    }
    
    func setAccessory(indexPath: NSIndexPath)->UITableViewCell{
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        switch(indexPath.row){
        case 0: cell.accessoryType = UITableViewCellAccessoryType.None
        case 1: cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        case 2: cell.accessoryType = UITableViewCellAccessoryType.DetailDisclosureButton
        case 3: cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        case 4: cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        default: cell.accessoryType = UITableViewCellAccessoryType.None
        }
        cell.textLabel?.text = accessories[indexPath.row]
        return cell
    }
    
    // gets the content on cell and calls segue to go next page when a cell is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        // set the contetnt of the cell to variable and call segue to go to the next view
        if style == "Separator" {
            separator = separators[indexPath.row]
            performSegueWithIdentifier("toSeparator",sender: nil)
            
        }
    }
    
    
    // Prepare segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSeparator") {
            let separatorTable: SeparatorTableViewController = segue.destinationViewController as SeparatorTableViewController
            separatorTable.style = separator
        }
    }

}
