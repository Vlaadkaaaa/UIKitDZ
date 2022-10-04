//
//  SignInViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
/// Авторизация
final class SignInViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func signInAction(_ sender: Any) {
        for user in users.users {
            if user.login != loginTextField.text && user.password != passwordTextField.text {
                let alertController = UIAlertController(title: "Ошибка",
                                                        message: "Пользователь не найден",
                                                        preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
                present(alertController, animated: true)
            } else {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(
                    withIdentifier: "TabBarController") as? UITabBarController else {return}
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        }
    }
}
