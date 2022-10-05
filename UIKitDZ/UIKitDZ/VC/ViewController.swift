//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Первый экран приложения
final class ViewController: UIViewController {
    
    var users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func signInAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        if users.userDefaults.bool(forKey: "login") {
            guard let vc = storyBoard.instantiateViewController(
                withIdentifier: "TabBarController") as? UITabBarController else { return }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } else {
            guard let vc = storyBoard.instantiateViewController(
                withIdentifier: "SignInVC") as? SignInViewController else { return }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func registrationAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "RegistrationVC") as? RegistrationViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
