//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
/// Регистрация
final class RegistrationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    var users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationSettingKeyboard()
        signAsADelegate()
    }
    
    // MARK: - Private Method
    private func signAsADelegate() {
        surnameTextField.delegate = self
        nameTextField.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func notificationSettingKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.y = -CGFloat(200)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                               object: nil, queue: nil) { _ in
            self.view.frame.origin.y = 0
        }
    }
    
    // MARK: - IBAction
    @IBAction func registerAction(_ sender: Any) {
        for user in users.users {
            if user.login == loginTextField.text {
                let alertController = UIAlertController(title: "Ошибка",
                                                        message: "Пользователь с таким логином уже зарегистрирован",
                                                        preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
                present(alertController, animated: true)
            } else {
                users.addNewUser(surname: surnameTextField.text ?? "",
                                 name: nameTextField.text ?? "",
                                 login: loginTextField.text ?? "",
                                 password: passwordTextField.text ?? "")
                
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyBoard.instantiateViewController(
                    withIdentifier: "TabBarController") as? UITabBarController else { return }
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
            }
        }
        
    }
}

// MARK: - UITextFieldDelegate
extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == surnameTextField {
            nameTextField.becomeFirstResponder()
        } else if textField == nameTextField {
            loginTextField.becomeFirstResponder()
        } else if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
