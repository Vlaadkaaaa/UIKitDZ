//
//  MenuViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 28.09.2022.
//

import UIKit
/// В данном классе отображается меню заведения
final class MenuViewController: UIViewController {
    
    var pizzaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 150, width: 370, height: 100))
        button.setTitle("Pizza", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    var sushiButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 300, width: 370, height: 100))
        button.setTitle("Sushi", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewElementsAndAction()
    }
    @objc func supportAllertAction() {
        let alertController = UIAlertController(title: "Здравствуйте",
                                                message: "Наш номер для ваших вопросов: 8999999999",
                                                preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertOkAction)
        present(alertController, animated: true)
    }
    @objc func showNewVCAction() {
        let pizzaVC = PizzaViewController()
        self.navigationController?.pushViewController(pizzaVC, animated: true)
    }
    private func addViewElementsAndAction() {
        self.title = "Food"
        view.backgroundColor = .white
        view.addSubview(pizzaButton)
        view.addSubview(sushiButton)
        pizzaButton.addTarget(self, action: #selector(showNewVCAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:
                .compose,
                                                            target: self,
                                                            action: #selector(supportAllertAction))
    }
}
