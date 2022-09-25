//
//  ThirdViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import UIKit
/// Данный VC добавляет логику работы третьего экрана приложения
class ThirdViewController: UIViewController {
    
    @IBOutlet weak var nameClientLabel: UILabel!
    @IBOutlet weak var salePaymentLabel: UILabel!
    @IBOutlet weak var saleBookingLabel: UILabel!
    @IBOutlet weak var addVIPProcentLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    var bookingBool: Bool?
    var paymentBool: Bool?
    var vipBool: Bool?
    var nameClient = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameClientLabel.text = nameClient
        checkSale()
    }
    
    func checkSale() {
        var salad = 650.0
        if bookingBool ?? false {
            salad -= (salad * 0.05)
            saleBookingLabel.text = "-5%"
        } else {
            saleBookingLabel.text = "0%"
        }
        if paymentBool ?? false {
            salad -= (salad * 0.05)
            salePaymentLabel.text = "-5%"
        } else {
            salePaymentLabel.text = "0%"
        }
        if vipBool ?? false {
            salad += (salad * 0.15)
            addVIPProcentLabel.text = "+15%"
        } else {
            addVIPProcentLabel.text = "0%"
        }
        totalLabel.text = "\(salad)$"
    }
}
