//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Colin on 1/20/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var numStudentsTF: UITextField!
    
    
    var selectedCellIndex = 0
    var college : College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = college.image
        nameTF.text = college.name
        locationTF.text = college.location
        numStudentsTF.text = String(college.numStudents)
        
    }
    
    @IBAction func saveCollegeInfo(sender: AnyObject) {
        college.name = nameTF.text!
        college.location = locationTF.text!
        college.numStudents = Int(numStudentsTF.text!)!
        college.image = imageView.image
    }
    
    
    
}