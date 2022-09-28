//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Данный VC добавляет логику работы первого экрана приложения
class ViewController: UIViewController {
  
    @IBOutlet weak var noneClient: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginDataBase = [(email: "1", password: "1")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signInButtonAction(_ sender: Any) {
        if checkLogin(email: emailTextField.text ?? "user", password: passwordTextField.text ?? "user") {
            showNewVC(identifier: "secondVC")
        } else {
            noneClient.text = "Пользователь не найден"
        }
    }
    func showNewVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(
            withIdentifier: identifier) as? SecondViewController else {return}
        self.present(vc, animated: true, completion: nil)
    }
    
    func checkLogin(email: String, password: String) -> Bool {
        for user in loginDataBase {
            if user.email == email && user.password == password {
                return true
            }
        }
        return false
    }
}
