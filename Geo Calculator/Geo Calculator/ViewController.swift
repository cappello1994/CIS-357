//
//  ViewController.swift
//  Geo Calculator
//
//  Created by X Code User on 9/20/17.
//  Copyright © 2017 GVSU School of Computing. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {

    @IBOutlet weak var latitudeField1: UITextField!
    
    @IBOutlet weak var latitudeField2: UITextField!
    
    @IBOutlet weak var longitudeField1: UITextField!
    
    @IBOutlet weak var longitudeField2: UITextField!
    @IBOutlet weak var distanceResultField: UITextField!
    @IBOutlet weak var bearingResultField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        
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
        calculateDistance()
        calculateBearing()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

