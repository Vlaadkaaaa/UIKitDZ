//
//  TranslateViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
///
final class TranslateViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func translateWordAction(_ sender: Any) {
        switch wordTextField.text {
        case "Привет": wordLabel.text = "Hello"
        case "Пока": wordLabel.text = "Bye"
        default: wordLabel.text = "Хз"
        }
    }
}
