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
        editButton.tag = 0
        
        colleges.append(College(name: "Purdue University", location: "West Lafayette, IN", numStudents: 38770, image: UIImage(named: "purdue")!))
        
            colleges.append(College(name: "University of Illinois", location: "Urbana-Champaign, IL", numStudents: 44087, image: UIImage(named: "uiuc")!))
        
        colleges.append(College(name: "University of Wisconsin - Madison", location: "Madison, WI", numStudents: 43193, image: UIImage(named: "uwmadison")!))
    }
    
    
    
    @IBAction func editButtonTapped(sender: AnyObject) {
        if editButton.tag == 0 {
            tableView.editing = true
            editButton.tag = 1
        } else {
            tableView.editing = false
            editButton.tag = 0
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add College Location"
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (numStudentsTextField) -> Void in
            numStudentsTextField.placeholder = "Add Student Population"
            numStudentsTextField.keyboardType = UIKeyboardType.NumberPad
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (add) -> Void in
            
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let numStudentsTF = myAlert.textFields![2] as UITextField
            
            self.colleges.append(College(name: collegeTF.text!, location: locationTF.text!, numStudents: Int(numStudentsTF.text!)!))
            self.tableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil) //presents alert view
        
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

