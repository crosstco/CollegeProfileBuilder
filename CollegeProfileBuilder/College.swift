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
    
    
    init(name : String, location : String, numStudents : Int, image : UIImage) {
        super.init()
        self.name = name
        self.location = location
        self.numStudents = numStudents
        self.image = image
    }
    
    init(name: String, location : String, numStudents : Int) {
        super.init()
        self.name = name
        self.location = location
        self.numStudents = numStudents
    }
    
}
