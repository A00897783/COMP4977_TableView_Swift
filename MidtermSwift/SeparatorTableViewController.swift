//
//  SeparatorTableViewController.swift
//  MidtermSwift
//
//  Created by 佐藤麻央 on 2015/02/19.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

import UIKit

class SeparatorTableViewController: UITableViewController {
    
    var style: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = style
        
        if(style == "None"){
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        }else if(style == "Single Line"){
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        }else if (style == "Single Line Etched"){
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLineEtched

        }
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
        return cells.count
    }
    
    var cells = ["cell 1", "cell 2","cell 3", "cell 4"]
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = cells[indexPath.row]
        if(style == "Single Line Etched"){
            cell.contentView.backgroundColor = UIColor.greenColor()
        }
        return cell
    }
    
}
