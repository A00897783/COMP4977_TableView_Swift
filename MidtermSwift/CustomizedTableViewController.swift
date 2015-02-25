//
//  CustomizedTableViewController.swift
//  MidtermSwift
//
//  Created by 佐藤麻央 on 2015/02/20.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

import UIKit

class CustomizedTableViewController: UITableViewController {

    let imgArray = ["img0.png","img1.jpg","img2.jpg"]
    
    let label2Array = ["2013/8/23/16:04","2013/8/23/16:15","2013/8/23/16:47"]

    let label1Array = ["BCIT","D'Arcy Smith","Set R"]

    var style: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Customized"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    // Return the number of sections.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows in the section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as UITableViewCell

        var img = UIImage(named:imgArray[indexPath.row])
        var imageView = tableView.viewWithTag(1) as UIImageView
        imageView.image = img
        
        let label1 = tableView.viewWithTag(2) as UILabel
        label1.text = label1Array[indexPath.row]
        
        var label2 = tableView.viewWithTag(3) as UILabel
        label2.text = label2Array[indexPath.row]
        
        return cell
    }
    

}
