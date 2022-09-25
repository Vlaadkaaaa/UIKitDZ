//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
class ViewController: UIViewController {
    
    let logoView: UIView = {
        let view = UIView(frame: CGRect(x: 90, y: 80, width: 210, height: 100))
        view.backgroundColor = .black
        return view
    }()
    let logoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 91, y: 81, width: 208, height: 98))
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = "Birthday Reminder"
        label.textColor = UIColor(cgColor: CGColor(red: 173/255, green: 198/255, blue: 244/255, alpha: 1.0))
        return label
    }()
    
    var signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 250, width: 350, height: 40))
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "Sign In"
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 300, width: 350, height: 20))
        label.text = "Email"
        label.textColor = UIColor(cgColor: CGColor(red: 173/255, green: 198/255, blue: 244/255, alpha: 1.0))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 40, y: 330, width: 310, height: 40))
        textField.placeholder = "Введите свой email"
        textField.borderStyle = .roundedRect
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 390, width: 310, height: 20))
        label.text = "Password"
        label.textColor = UIColor(cgColor: CGColor(red: 173/255, green: 198/255, blue: 244/255, alpha: 1.0))
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
    
    let faceIdLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 500, width: 150, height: 30))
        label.text = "Вход по Face ID"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    let faceIdSwitch: UISwitch = {
        let faceSwitch = UISwitch(frame: CGRect(x: 300, y: 500, width: 0, height: 0))
        return faceSwitch
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 590, width: 310, height: 50))
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(cgColor: CGColor(red: 173/255, green: 198/255, blue: 244/255, alpha: 1.0))
        return button
    }()
    let color = UIColor(cgColor: CGColor(red: 174/255, green: 198/255, blue: 245/255, alpha: 1.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewElements()
    }
    func showViewElements() {
        self.view.addSubview(signInLabel)
        self.view.addSubview(logoView)
        self.view.addSubview(logoLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signInButton)
        self.view.addSubview(faceIdLabel)
        self.view.addSubview(faceIdSwitch)
        
        signInButton.addTarget(self, action: #selector(showNewVCAction), for: .allTouchEvents)

    }
    
    @objc func showNewVCAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "birthdayVC") as? BirthdayViewController else {return}
        self.present(vc, animated: true, completion: nil)
    }
}
