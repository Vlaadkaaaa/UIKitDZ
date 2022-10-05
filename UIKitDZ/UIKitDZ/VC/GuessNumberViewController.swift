//
//  GuessNumberViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
/// Игра "Угадай Число"
final class GuessNumberViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var sliderOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBAction
    @IBAction func guessNumberAction(_ sender: Any) {
        let random = Int.random(in: 0...100)
        if "\(random)" == "\(sliderOutlet.value)" {
            let alertController = UIAlertController(title:
                                                        "Поздравляю!! Вы угадали", message: "",
                                                    preferredStyle: .alert)
            let actionAdd = UIAlertAction(title: "Еще разок?", style: .default)
            alertController.addAction(actionAdd)
            self.present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(title: "Не угадал", message: "", preferredStyle: .alert)
            let actionAdd = UIAlertAction(title: "Еще разок?", style: .default)
            alertController.addAction(actionAdd)
            self.present(alertController, animated: true)
        }
    }
}
