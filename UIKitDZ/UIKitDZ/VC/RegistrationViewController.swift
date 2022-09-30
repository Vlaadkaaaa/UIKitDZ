//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Данный класс отвечает за окно входа в приложение
final class RegistrationViewController: UIViewController {
    
    let logoView: UIView = {
        let view = UIView(frame: CGRect(x: 90, y: 80, width: 210, height: 100))
        view.backgroundColor = .black
        return view
    }()
    let logoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 91, y: 81, width: 208, height: 98))
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "Bringo"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        return label
    }()
    
    var signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 250, width: 350, height: 40))
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "Sign In"
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 300, width: 350, height: 20))
        label.text = "Phone"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var phoneTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 40, y: 330, width: 310, height: 40))
        textField.placeholder = "Введите свой телефон"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 390, width: 310, height: 20))
        label.text = "Password"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 40, y: 420, width: 310, height: 40))
        textField.placeholder = "Введите свой пароль"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    var eyeButton: UIButton {
       let button = UIButton(frame: CGRect(x: 320, y: 430, width: 30, height: 30))
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.addTarget(self, action: #selector(showSecretPasswordAction), for: .touchUpInside)
        return button
    }
    let signInButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 590, width: 310, height: 50))
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       addViewElementsAndAction()
    }
    
    @objc func showSecretPasswordAction() {
        guard passwordTextField.isSecureTextEntry else { return passwordTextField.isSecureTextEntry = true }
        passwordTextField.isSecureTextEntry = false
    }
    @objc func showNewVCAction() {
        let menuVC = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    private func addViewElementsAndAction() {
        view.addSubview(signInLabel)
        view.addSubview(logoView)
        view.addSubview(logoLabel)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(eyeButton)
        
        signInButton.addTarget(self, action: #selector(showNewVCAction), for: .touchUpInside)
    }
}
