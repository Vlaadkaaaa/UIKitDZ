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
        passwordTextFieldShow()
    }
    
    // MARK: - IBAction
    @IBAction func registretionAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "RegistrationVC") as? RegistrationViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
                users.userDefaults.setValue(loginTextField.text, forKey: "login")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(
                    withIdentifier: "TabBarController") as? UITabBarController else {return}
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Private Func
    private func passwordTextFieldShow() {
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
    }
}
