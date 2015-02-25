//
//  ViewController.swift
//  MidtermSwift
//
//  Created by 佐藤麻央 on 2015/01/26.
//  Copyright (c) 2015年 bcit. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var textField: UITextField!
  
    @IBOutlet var tableView: UITableView!
    
    var content: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = content
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    @IBAction func add(sender: AnyObject) {
        texts.append(textField.text)
        textField.text = ""
        tableView.reloadData()
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView DataSource
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if(indexPath.row == 0){
            return false
        }
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            texts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        default:
            return
        }
    }

    // data for tableview
    var texts = ["Cell 1(delete function disabled)", "Cell 2", "Cell 3", "Cell 4"]
    
   //return the number of section
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    // returns
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    // sets the content of cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
    
    // called when a cell is selected
    //gets the content on cell and calls segue to go next page when a cell is selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath!) {
        var alert = UIAlertController(title: "Edit", message: "Enter New Name", preferredStyle: UIAlertControllerStyle.Alert)
        
        let saveAction = UIAlertAction(title: "SAVE", style: .Default)
            {
                action in println("save!")
                let textf = alert.textFields?[0] as UITextField
                self.texts[indexPath.row] = textf.text
                self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .Cancel)
            {
                action in println("Cancelled!")
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.text = self.texts[indexPath.row]
            textField.secureTextEntry = false
        })
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}

