//
//  GeoCalcTextField.swift
//  GeoCalculator
//
//  Created by stephanie Cappello on 10/16/17.
//  Copyright © 2017 Jonathan Engelsma. All rights reserved.
//

import UIKit

class GeoCalcTextField: DecimalMinusTextField {

    override func awakeFromNib() {
        self.backgroundColor = BACKGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: FOREGROUND_COLOR])
        self.tintColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 6.0
        self.textColor = FOREGROUND_COLOR
    }

}
