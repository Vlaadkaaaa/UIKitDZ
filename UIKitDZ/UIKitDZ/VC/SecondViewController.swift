//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import UIKit
/// Данный VC добавляет логику работы второго экрана приложения
class SecondViewController: UIViewController {

    @IBOutlet weak var bookingSwitch: UISwitch!
    @IBOutlet weak var preparePaymentSwitch: UISwitch!
    @IBOutlet weak var vipRoomSwitch: UISwitch!
    @IBOutlet weak var nameClientTextField: UITextField!

    var sale = Sale()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sale.isBooking = true
    }

    @IBAction func invoiceButtonAction(_ sender: Any) {
        showAlert()
    }
    func checkSwitch() {
        bookingSwitch.isOn ? (sale.isBooking = true) : (sale.isBooking = false)
        preparePaymentSwitch.isOn ? (sale.isPrepayment = true) : (sale.isPrepayment = false)
        vipRoomSwitch.isOn ? (sale.isVipRomm = true) : (sale.isVipRomm = false)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Выставить счет?", message: "", preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.checkSwitch()
            self.showNewVC(identifier: "thirdVC")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(alertOkAction)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    func showNewVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let vc = storyboard.instantiateViewController(
                  withIdentifier: identifier) as? ThirdViewController else { return }
        vc.bookingBool = sale.isBooking
        vc.paymentBool = sale.isPrepayment
        vc.vipBool = sale.isVipRomm
        vc.nameClient = nameClientTextField.text ?? ""
     
        self.present(vc, animated: true, completion: nil)
    }
}
