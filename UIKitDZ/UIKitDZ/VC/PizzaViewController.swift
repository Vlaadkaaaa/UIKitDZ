//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 28.09.2022.
//

import UIKit
/// В данном классе представлен список имеющихся пицц
final class PizzaViewController: UIViewController {
    var margaritaPizzaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 335, y: 160, width: 40, height: 40))
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .white
        button.tag = 1
        return button
    }()
    var margaritaPizzaImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 120, width: 120, height: 120))
        image.image = UIImage(named: "margarita")
        return image
    }()
    var margaritaPizzaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 170, y: 165, width: 140, height: 30))
        label.text = "Margarita"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    var peperoniPizzaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 335, y: 320, width: 40, height: 40))
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .white
        button.tag = 2
        return button
    }()
    var peperoniPizzaImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 280, width: 120, height: 120))
        image.image = UIImage(named: "peperoni")
        return image
    }()
    var peperoniPizzaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 170, y: 325, width: 140, height: 30))
        label.text = "Peperoni"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    var arrivaPizzaButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 335, y: 480, width: 40, height: 40))
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.imageView?.tintColor = .white
        button.tag = 3
        return button
    }()
    var arrivaPizzaImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 30, y: 440, width: 120, height: 120))
        image.image = UIImage(named: "arriva")
        return image
    }()
    var arrivaPizzaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 170, y: 485, width: 140, height: 30))
        label.text = "Arriva"
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewElementsAndAction()
    }
    
    @objc func showIngredientsVCAction(sender: UIButton) {
        let ingredientsVC = IngredientsViewController()
        switch sender.tag {
        case 1:
            ingredientsVC.pizzaName = "margarita"
        case 2:
            ingredientsVC.pizzaName = "peperoni"
        case 3:
            ingredientsVC.pizzaName = "arriva"
        default: break
        }
        present(ingredientsVC, animated: true)
    }
    private func addViewElementsAndAction() {
        title = "Pizza"
        view.addSubview(margaritaPizzaButton)
        view.addSubview(margaritaPizzaImage)
        view.addSubview(margaritaPizzaLabel)
        view.addSubview(peperoniPizzaImage)
        view.addSubview(peperoniPizzaLabel)
        view.addSubview(peperoniPizzaButton)
        view.addSubview(arrivaPizzaImage)
        view.addSubview(arrivaPizzaLabel)
        view.addSubview(arrivaPizzaButton)
        
        margaritaPizzaButton.addTarget(self, action: #selector(showIngredientsVCAction), for: .touchUpInside)
        peperoniPizzaButton.addTarget(self, action: #selector(showIngredientsVCAction), for: .touchUpInside)
        arrivaPizzaButton.addTarget(self, action: #selector(showIngredientsVCAction), for: .touchUpInside)
    }
    
}
