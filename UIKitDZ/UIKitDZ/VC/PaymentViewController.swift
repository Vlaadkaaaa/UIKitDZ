//
//  PaymentViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 28.09.2022.
//

import UIKit
/// Оплата заказа
final class PaymentViewController: UIViewController {
    
    let orderUserLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 120, width: 200, height: 30))
        label.text = "Ваш заказ:"
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    var namePizzaLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 30, y: 160, width: 300, height: 40))
        label.text = pizzaName?.capitalized
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }
    let addExtrasLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 220, width: 300, height: 30))
        label.text = "Допольнительно вы выбрали:"
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    let oneExtrasIngredintLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 260, width: 300, height: 30))
        label.text = ""
        return label
    }()
    let twoExtrasIngredintLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 300, width: 300, height: 30))
        label.text = ""
        return label
    }()
    let threExtrasIngredintLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 340, width: 300, height: 30))
        label.text = ""
        return label
    }()
    let fourExtrasIngredintLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 380, width: 300, height: 30))
        label.text = ""
        return label
    }()
    let paymentLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 560, width: 300, height: 30))
        label.text = "Выберите способ оплаты:"
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    let cardPaymentLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 600, width: 200, height: 30))
        label.text = "Картой"
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    let cardPaymentSwitch: UISwitch = {
        let cardSwitch = UISwitch(frame: CGRect(x: 300, y: 600, width: 0, height: 0))
        return cardSwitch
    }()
    
    let cashPaymentLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 640, width: 200, height: 30))
        label.text = "Наличными"
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    let cashPaymentSwitch: UISwitch = {
        let cashSwitch = UISwitch(frame: CGRect(x: 300, y: 640, width: 0, height: 0))
        return cashSwitch
    }()
    let payButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 720, width: 300, height: 50))
        button.setImage(UIImage(systemName: "applelogo"), for: .normal)
        button.imageView?.tintColor = .white
        button.setTitle(" Pay", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return button
    }()
    var pizzaName: String?
    var isAddChess: Bool?
    var isAddHam: Bool?
    var isAddFungus: Bool?
    var isAddOlives: Bool?
    
    weak var delegate: PopToRootVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewElementsAndAction()
        
    }
    
    @objc func changedCardSwitchAction() {
        if cashPaymentSwitch.isOn {
            cashPaymentSwitch.setOn(false, animated: true)
        }
    }
    @objc func changedCashSwitchAction() {
        if cardPaymentSwitch.isOn {
            cardPaymentSwitch.setOn(false, animated: true)
        }
    }
    @objc func supportAllertAction() {
        let alertController = UIAlertController(title: "Здравствуйте",
                                                message: "Наш номер для ваших вопросов: 8999999999",
                                                preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(alertOkAction)
        present(alertController, animated: true)
    }
    
    @objc func paymentOrderAndGoMenuVCAction() {
        let alertController = UIAlertController(title: "Заказ оплачен",
                                                message: "Ваш заказ будет доставлен в течении 15 минут!",
                                                preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.dismiss(animated: false)
            self.delegate?.goTOBack()
        }
        alertController.addAction(alertOkAction)
        present(alertController, animated: true)
    }
    private func addViewElementsAndAction() {
        view.addSubview(orderUserLabel)
        view.addSubview(namePizzaLabel)
        view.addSubview(addExtrasLabel)
        view.addSubview(oneExtrasIngredintLabel)
        view.addSubview(twoExtrasIngredintLabel)
        view.addSubview(threExtrasIngredintLabel)
        view.addSubview(fourExtrasIngredintLabel)
        view.addSubview(cardPaymentLabel)
        view.addSubview(cashPaymentLabel)
        view.addSubview(paymentLabel)
        view.addSubview(cardPaymentSwitch)
        view.addSubview(cashPaymentSwitch)
        view.addSubview(payButton)
        title = "Payment"
        view.backgroundColor = .white
        
        presentExstrasIngredients()
        payButton.addTarget(self, action: #selector(paymentOrderAndGoMenuVCAction), for: .touchUpInside)
        cardPaymentSwitch.setOn(true, animated: true)
        cardPaymentSwitch.addTarget(self, action: #selector(changedCardSwitchAction), for: .valueChanged)
        cashPaymentSwitch.addTarget(self, action: #selector(changedCashSwitchAction), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:
                .compose,
                                                            target: self,
                                                            action: #selector(supportAllertAction))
    }
}

extension PaymentViewController {
    func checkIsEmptyLabel(text: String) {
        let emptyString = ""
        if oneExtrasIngredintLabel.text == emptyString {
            oneExtrasIngredintLabel.text = text
        } else if twoExtrasIngredintLabel.text == emptyString {
            twoExtrasIngredintLabel.text = text
        } else if threExtrasIngredintLabel.text == emptyString {
            threExtrasIngredintLabel.text = text
        } else if fourExtrasIngredintLabel.text == emptyString {
            fourExtrasIngredintLabel.text = text
        }
    }
    func presentExstrasIngredients() {
        if isAddChess ?? false {
            checkIsEmptyLabel(text: "Сыр моццарела")
        }
        if isAddHam ?? false {
            checkIsEmptyLabel(text: "Ветчина")
        }
        if isAddFungus ?? false {
            checkIsEmptyLabel(text: "Грибы")
        }
        if isAddOlives ?? false {
            checkIsEmptyLabel(text: "Маслины")
        }
    }
}
