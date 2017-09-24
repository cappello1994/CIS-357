//
//  ViewController.swift
//  Geo Calculator
//
//  Created by X Code User on 9/20/17.
//  Copyright © 2017 GVSU School of Computing. All rights reserved.
//

import UIKit
import Foundation
class MainViewController: UIViewController {
    
    //var String: userLat1
    
    @IBOutlet weak var latitudeField1: UITextField!
    
    @IBOutlet weak var latitudeField2: UITextField!
    
    @IBOutlet weak var longitudeField1: UITextField!
    
    @IBOutlet weak var longitudeField2: UITextField!
    @IBOutlet weak var distanceResultField: UITextField!
    @IBOutlet weak var bearingResultField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        self.view.addGestureRecognizer(detectTouch)
        self.latitudeField1.delegate = self
        self.longitudeField1.delegate = self
        self.latitudeField2.delegate = self
        //self.calculateButton.delegate  = self
        
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        //TODO ask if you need to use self??
        self.latitudeField1.text = ""
        self.latitudeField2.text = ""
        self.longitudeField1.text = ""
        self.longitudeField2.text = ""
        self.distanceResultField.text = ""
        self.bearingResultField.text = ""
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print("Calculating")
        self.dismissKeyboard()
        self.calculateDistance()
        self.calculateBearing()
    }
    
    func calculateDistance(){
        if let lat1 = self.latitudeField1.text, let lat2 = self.latitudeField2.text, let lon1 = self.longitudeField1.text, let lon2 = self.longitudeField2.text{
            if( lat1 != "" && lat2 != "" && lon1 != "" && lon2 != "" ){
                let R = 6371.0
                let dlat = (Double(lat2)! - Double(lat1)!) * (Double.pi/180)
                let dlon = Double(lon2)! - Double(lon1)! * (Double.pi/180)
                
                
                let a = sin(dlat/2) * sin(dlat/2)
                
                let b = cos(Double(lat1)!*(Double.pi/180)) * cos(Double(lat2)!*(Double.pi/180)) * sin(dlon/2) * sin(dlon/2)
                
                let c = a + b
                
                let d = 2 * atan2(sqrt(c), sqrt(1-c))
                
                let e = R * d //Distance in km
                
                let distance = round( e * 100 ) / 100
                
                self.distanceResultField.text = "\(distance) km"
                
                
            }
        }
    }
    
    func calculateBearing(){
        if let lat1 = self.latitudeField1.text, let lat2 = self.latitudeField2.text, let lon1 = self.longitudeField1.text, let lon2 = self.longitudeField2.text{
            if( lat1 != "" && lat2 != "" && lon1 != "" && lon2 != "" ){
                
                
                
                let lonTheta1 = Double(lon1)! * (Double.pi/180)
                let lonTheta2 = Double(lon2)! * (Double.pi/180)
                
                
                let dlon = lonTheta2 - lonTheta1
                
                let x = sin(dlon) * cos(Double(lat2)!)
                let y = cos(Double(lat1)!) * sin(Double(lat2)!) - sin(Double(lat1)!) * cos(Double(lat2)!) * cos(dlon)
                
                let z = atan2(y,x) * (180/Double.pi)
                
                let bearing = round( 100 * z ) / 100
                self.bearingResultField.text = "\(bearing) deg"
                
                
            }
        }
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSettings" {
            if let destVC = segue.destination.childViewControllers[0] as? SettingsViewController{
                destVC.userLat1 = self.latitudeField1.text
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MainViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if( textField == self.latitudeField1 ){
            self.longitudeField1.becomeFirstResponder()
        }
        
        else if( textField == self.longitudeField1 ){
            self.latitudeField2.becomeFirstResponder()
        }
        
        else if( textField == self.latitudeField2 ){
            self.longitudeField2.becomeFirstResponder()
        }
        
        else{
            self.calculateButton.becomeFirstResponder()
        }
        
        return true
    }
}

