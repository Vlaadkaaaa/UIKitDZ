//
//  BirthdayViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 23.09.2022.
//

import UIKit
///
class BirthdayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(titleLabel)

    }
    var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 145, y: 10, width: 100, height: 30))
        label.text = "Birtday"
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }()
    
}
