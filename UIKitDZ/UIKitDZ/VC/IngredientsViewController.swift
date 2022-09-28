//
//  IngredientsViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 28.09.2022.
//

import UIKit
///
class IngredientsViewController: UIViewController {
    var namePizzalabel: UILabel {
       let label = UILabel(frame: CGRect(x: 20, y: 20, width: 350, height: 40))
        label.textAlignment = .center
        label.text = pizzaName.capitalized
        label.font = .systemFont(ofSize: 40)
        return label
    }
    var imagePizza: UIImageView {
        let image = UIImageView(frame: CGRect(x: 30, y: 100, width: 330, height: 330))
        image.image = UIImage(named: pizzaName)
        return image
    }
    let addChessLabel: UILabel = {
       let label =  UILabel(frame: CGRect(x: 43, y: 450, width: 150, height: 30))
        label.text = "Сыр моццарела"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    let addChessSwitch: UISwitch = {
       let addSwitch = UISwitch(frame: CGRect(x: 300, y: 450, width: 0, height: 0))
        return addSwitch
    }()
    let addHamLabel: UILabel = {
       let label =  UILabel(frame: CGRect(x: 43, y: 500, width: 150, height: 30))
        label.text = "Ветчина"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    let addHamSwitch: UISwitch = {
       let addSwitch = UISwitch(frame: CGRect(x: 300, y: 500, width: 0, height: 0))
        return addSwitch
    }()
    let addFungusLabel: UILabel = {
       let label =  UILabel(frame: CGRect(x: 43, y: 550, width: 150, height: 30))
        label.text = "Грибы"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    let addFungusSwitch: UISwitch = {
       let addSwitch = UISwitch(frame: CGRect(x: 300, y: 550, width: 0, height: 0))
        return addSwitch
    }()
    let addOlivesLabel: UILabel = {
       let label =  UILabel(frame: CGRect(x: 43, y: 600, width: 150, height: 30))
        label.text = "Маслины"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    let addOlivesSwitch: UISwitch = {
       let addSwitch = UISwitch(frame: CGRect(x: 300, y: 600, width: 0, height: 0))
        return addSwitch
    }()
    let chooseButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 43, y: 670, width: 304, height: 60))
        button.backgroundColor = .systemOrange
        button.setTitle("Выбрать", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    var pizzaName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(namePizzalabel)
        view.addSubview(imagePizza)
        view.addSubview(addChessLabel)
        view.addSubview(addChessSwitch)
        view.addSubview(addHamLabel)
        view.addSubview(addHamSwitch)
        view.addSubview(addFungusLabel)
        view.addSubview(addFungusSwitch)
        view.addSubview(addOlivesLabel)
        view.addSubview(addOlivesSwitch)
        view.addSubview(chooseButton)
        
        chooseButton.addTarget(self, action: #selector(showPaymentVCAction), for: .touchUpInside)

    }
    @objc func showPaymentVCAction() {
        let paymentVC = PaymentViewController()
        let navigationController = UINavigationController(rootViewController: paymentVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

}
