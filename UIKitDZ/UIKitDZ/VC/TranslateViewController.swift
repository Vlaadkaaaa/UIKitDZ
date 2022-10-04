//
//  TranslateViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
/// Переводчик
final class TranslateViewController: UIViewController {
    
    // MARK: - IBOUtlet
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func translateWordAction(_ sender: Any) {
        switch wordTextField.text {
        case "Привет": wordLabel.text = "Hello"
        case "Пока": wordLabel.text = "Bye"
        default: wordLabel.text = "Хз"
        }
    }
}
