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

    var model = Sale()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.isBooking = true
    }

    @IBAction func invoiceButtonAction(_ sender: Any) {
        showAlert()
    }
    func checkSwitch() {
        bookingSwitch.isOn ? (model.isBooking = true) : (model.isBooking = false)
        preparePaymentSwitch.isOn ? (model.isPrepayment = true) : (model.isPrepayment = false)
        vipRoomSwitch.isOn ? (model.isVipRomm = true) : (model.isVipRomm = false)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Выставить счет?", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.checkSwitch()
            self.showNewVC(identifier: "thirdVC")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    func showNewVC(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              guard let vc = storyboard.instantiateViewController(
                  withIdentifier: identifier) as? ThirdViewController else {return}
        vc.bookingBool = model.isBooking
        vc.paymentBool = model.isPrepayment
        vc.vipBool = model.isVipRomm
        vc.nameClient = nameClientTextField.text ?? ""
     
        self.present(vc, animated: true, completion: nil)
    }
}
