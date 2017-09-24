//
//  SettingsViewController.swift
//  Geo Calculator
//
//  Created by X Code User on 9/24/17.
//  Copyright © 2017 GVSU School of Computing. All rights reserved.
//

import UIKit
protocol SettingsViewContollerDelegate {
    func settingsChanged(distanceUnits: String, bearingUnits: String)
}
class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var userLat1: String?
    
    
    @IBOutlet weak var unitPicker: UIPickerView!
    
    var unitPickerData : [String] = [String]()
    var selection : String = "Kilometers"
    var delegate : SettingsViewContollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.unitPicker.delegate = self
        self.unitPicker.dataSource = self
        unitPickerData = ["Kilometers", "Miles", "Degrees", "Mils"]

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.settingsChanged(distanceUnits: selection, bearingUnits: selection)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unitPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unitPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selection = self.unitPickerData[row]
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
