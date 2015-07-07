//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by Connor Pan on 7/6/15.
//  Copyright © 2015 Connor Pan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nameInputField: UITextField!
    
    @IBOutlet weak var stateInputField: UITextField!
    
    @IBOutlet weak var sizeInputField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var webURLInput: UITextField!
    
    var imagePicker : UIImagePickerController!
    
    var college : Colleges!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameInputField.text = college.name
        stateInputField.text = college.state
        sizeInputField.text = String(college.size)
        imageView.image = college.image
        webURLInput.text = String("\(college.webURL!)")
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
       
    }

    @IBAction func onSaveButtonTapped(sender: UIButton) {
        college.name = nameInputField.text!
        college.state = stateInputField.text!
        college.size = Int(sizeInputField.text!)!
        college.image = imageView.image
        college.webURL = NSURL(string: "\(webURLInput.text!)")
        self.view.endEditing(true)
    }

    @IBAction func onCameraButtonTapped(sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = .Camera
        }
        else {
            imagePicker.sourceType = .PhotoLibrary
        }
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true) { () -> Void in
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                self.imageView.image = image
            }
        }
    }
    @IBAction func onDisplayButtonTapped(sender: UIButton) {
        UIApplication.sharedApplication().openURL(college.webURL!)
        self.view.endEditing(true)
    }
    
}
