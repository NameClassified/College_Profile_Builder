//
//  MapViewController.swift
//  collegeProfileBuilder
//
//  Created by Connor Pan on 7/8/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var mapAddress = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapTextField.text = mapAddress
        

        
    }

    @IBAction func onDoneButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


}
