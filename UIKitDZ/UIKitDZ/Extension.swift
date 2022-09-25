//
//  Extension.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 23.09.2022.
//

import Foundation
import UIKit

extension UITextField {
    func setBottomBorder(color: UIColor) {
             borderStyle = .none
             layer.backgroundColor = UIColor.white.cgColor
             layer.masksToBounds = false
             layer.shadowColor = color.cgColor
             layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
             layer.shadowOpacity = 1.0
             layer.shadowRadius = 0.0
    }
}
