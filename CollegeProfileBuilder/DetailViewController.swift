//
//  DetailViewController.swift
//  CollegeProfileBuilder
//
//  Created by Colin on 1/20/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SFSafariViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var numStudentsTF: UITextField!
    @IBOutlet weak var websiteTF: UITextField!
    
    
    var selectedCellIndex = 0
    var college : College!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = college.image
        nameTF.text = college.name
        locationTF.text = college.location
        numStudentsTF.text = String(college.numStudents)
        websiteTF.text = college.webpage
        
        imagePicker.delegate = self
        
    }
    
    @IBAction func saveCollegeInfo(sender: AnyObject) {
        college.name = nameTF.text!
        college.location = locationTF.text!
        college.numStudents = Int(numStudentsTF.text!)!
        college.image = imageView.image
    }
    
    
    @IBAction func visitCollegeWebsite(sender: AnyObject) {
        let url = NSURL(string: college.webpage)
        
        let SVC = SFSafariViewController(URL: url!)
        SVC.delegate = self
        
        presentViewController(SVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func addImage(sender: UITapGestureRecognizer) {
        
        if CGRectContainsPoint(imageView.frame, sender.locationInView(imageView)) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.college.image = selectedImage
            self.imageView.image = selectedImage
            print("selected")
        }
    }
    
}