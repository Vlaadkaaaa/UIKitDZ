//
//  PaymentViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 28.09.2022.
//

import UIKit
///
class PaymentViewController: UIViewController {
    
    let orderUserLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 120, width: 200, height: 30))
        label.text = "Ваш заказ"
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    let namePizzaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 220, width: 300, height: 30))
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment"
        view.backgroundColor = .white
        view.addSubview(orderUserLabel)
        view.addSubview(namePizzaLabel)
        view.addSubview(cardPaymentLabel)
        view.addSubview(cashPaymentLabel)
        view.addSubview(paymentLabel)
        view.addSubview(cardPaymentSwitch)
        view.addSubview(cashPaymentSwitch)
        view.addSubview(payButton)
    }
    
}
