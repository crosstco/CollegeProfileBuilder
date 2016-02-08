//
//  College.swift
//  CollegeProfileBuilder
//
//  Created by Colin on 1/20/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class College: NSObject {
    
    var name = ""
    var location = ""
    var numStudents = 0
    var image = UIImage(named: "default")
    var webpage = ""
    
    
    init(name : String, location : String, numStudents : Int, image : UIImage, webpage : String) {
        super.init()
        self.name = name
        self.location = location
        self.numStudents = numStudents
        self.image = image
        self.webpage = "http://" + webpage
    }
    
    init(name: String, location : String, numStudents : Int, webpage : String) {
        super.init()
        self.name = name
        self.location = location
        self.numStudents = numStudents
        self.webpage = webpage
    }
    
}
