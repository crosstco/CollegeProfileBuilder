 //
//  ViewController.swift
//  CollegeProfileBuilder
//
//  Created by Colin on 1/20/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        colleges.append(College(name: "Purdue University", location: "West Lafayette, IN", numStudents: 38770, image: UIImage(named: "purdue")!))
        
            colleges.append(College(name: "University of Illinois", location: "Urbana-Champaign, IL", numStudents: 44087, image: UIImage(named: "uiuc")!))
        
        colleges.append(College(name: "University of Wisconsin - Madison", location: "Madison, WI", numStudents: 43193, image: UIImage(named: "uwmadison")!))
    }
    
    
    //REQUIRED FUNCTIONS for TableView Protocols
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //Sends data to cell
        
        //create cell variable for tableView
        let collegeCell = tableView.dequeueReusableCellWithIdentifier("collegeCell", forIndexPath: indexPath)
        
        //sets properties of the cell
        collegeCell.textLabel?.text = colleges[indexPath.row].name
        collegeCell.detailTextLabel?.text = colleges[indexPath.row].location
        
        return collegeCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //sets num rows in table
        return colleges.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = tableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectedRow!]
    }

}

