//
//  MapViewController.swift
//  collegeProfileBuilder
//
//  Created by Connor Pan on 7/8/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mapTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var mapAddress = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapTextField.text = mapAddress
        textFieldShouldReturn(mapTextField)
        self.mapTextField.delegate = self
        
        
    }
    
    @IBAction func onDoneButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayMap(center: CLLocationCoordinate2D,
        span: MKCoordinateSpan,
        pinTitle: String) {
            let region = MKCoordinateRegionMake(center, span)
            let pin = MKPointAnnotation()
            pin.coordinate = center
            pin.title = mapTextField.text!
            mapView.addAnnotation(pin)
            mapView.setRegion(region, animated: true)
            
            
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let geocode = CLGeocoder()
        geocode.geocodeAddressString("\(mapAddress)") {placemarks, error in
        var number = placemarks!.count
        print("\(number)")
            
            if error != nil {
                print("error")
            }
                
            else {
                let actionSheet = UIAlertController(title: "Choose Location", message: "Please choose the correct location", preferredStyle: .ActionSheet)
                if number == 1 {
                    let placemark = placemarks!.first as CLPlacemark!
                    let center = placemark.location.coordinate
                    let span = MKCoordinateSpanMake(0.1, 0.1)
                    self.displayMap(center, span: span, pinTitle: "\(self.mapTextField.text!)")
                    
                }
                else {
                
                if number  > 5 {number = 5}
                if number == 5 || number < 5 {
                for index in 0..<number {
                    print("test")
                
                let placemark = placemarks![index] as CLPlacemark!
                let name = placemarks![index].name
                let local = placemarks![index].locality
                let state = placemarks![index].administrativeArea
                
                
                let action1 = UIAlertAction(title: "\(name), \(local), \(state)", style: .Default) { (action) -> Void in
                let center = placemark.location.coordinate
                let span = MKCoordinateSpanMake(0.1, 0.1)
                self.displayMap(center, span: span, pinTitle: "\(self.mapTextField.text)")
                
                }
                actionSheet.addAction(action1)
                
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
                }
                actionSheet.addAction(cancelAction)
                self.presentViewController(actionSheet, animated: true, completion: nil)
                }
                
                }
                
            }
            
        }
        mapTextField.resignFirstResponder()
        return true
    }
    

    
    
}