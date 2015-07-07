//
//  Colleges.swift
//  collegeProfileBuilder
//
//  Created by Connor Pan on 7/6/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit

class Colleges: NSObject {
    
    var name = ""
    var state = ""
    var size = 0
    var webURL = NSURL(string: "http://www.google.com")
    var image = UIImage(named: "default")
    
    convenience init(name: String, state: String, size: Int, image: UIImage, webURL: NSURL) {
        self.init()
        self.name = name
        self.state = state
        self.size = size
        self.webURL = webURL
        self.image = image
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }

}
