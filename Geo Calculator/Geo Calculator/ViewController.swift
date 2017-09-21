//
//  ViewController.swift
//  Geo Calculator
//
//  Created by X Code User on 9/20/17.
//  Copyright © 2017 GVSU School of Computing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var latitudeField1: UITextField!
    
    @IBOutlet weak var latitudeField2: UITextField!
    
    @IBOutlet weak var longitudeField1: UITextField!
    
    @IBOutlet weak var longitudeField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        //TODO ask if you need to use self??
        self.latitudeField1.text = ""
        self.latitudeField2.text = ""
        self.longitudeField1.text = ""
        self.longitudeField2.text = ""
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        print("Calculating")
        if let lat1 = self.latitudeField1.text{
            if lat1 != ""{
                print("Text received: \(lat1)")
            }
            
            else{
                print("Field cannot be blank")
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

