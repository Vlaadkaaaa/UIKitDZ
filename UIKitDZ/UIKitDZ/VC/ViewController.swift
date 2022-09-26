//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
class ViewController: UIViewController {
    
    var logoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 50, width: 100, height: 20 ))
        label.text = "Stepn"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    var loginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 360, width: 300, height: 30))
        label.text = "Login"
        label.textColor = .systemGray
        return label
    }()
    var loginTextField: UITextField = {
       let textField = UITextField(frame: CGRect(x: 35, y: 390, width: 320, height: 35))
        textField.placeholder = "  Введите свой логин"
        textField.layer.cornerRadius = 10
        textField.setBottomBorder(color: UIColor(red: 152/255, green: 245/255, blue: 217/255, alpha: 1.0))
        return textField
    }()
    var passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 440, width: 300, height: 30))
        label.text = "Password"
        label.textColor = .systemGray
        return label
    }()
    var passwordTextField: UITextField {
       let textField = UITextField(frame: CGRect(x: 35, y: 470, width: 320, height: 35))
        textField.placeholder = "  Введите свой пароль"
        textField.layer.cornerRadius = 10
        textField.setBottomBorder(color: UIColor(red: 152/255, green: 245/255, blue: 217/255, alpha: 1.0))
        return textField
    }
    var signInAction: UIButton {
        let button = UIButton(frame: CGRect(x: 35, y: 550, width: 320, height: 60))
        button.setTitle("Leeet's go", for: .normal)
        button.backgroundColor = UIColor(red: 152/255, green: 245/255, blue: 217/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showNewVC), for: .allEvents)
        return button
    }
    var imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 200))
        imageView.image = UIImage(named: "stepn")
        return imageView
    }()
    
    var menuArray = ["one", "two", "three"]
    let imageArray = [UIImage(named: "runner"),
                      UIImage(named: "trainer"),
                      UIImage(named: "walker")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        showView()
      
    }
    @objc func showNewVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "shopVC") as? ShopViewController else { return }
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController {
    func showView() {
        self.view.addSubview(logoLabel)
        self.view.addSubview(loginLabel)
        self.view.addSubview(loginTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(signInAction)
        self.view.addSubview(imageView)
    }
}
