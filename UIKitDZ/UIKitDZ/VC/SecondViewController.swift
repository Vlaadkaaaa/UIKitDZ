//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import UIKit
///
class SecondViewController: UIViewController {

    @IBOutlet weak var bookingSwitch: UISwitch!
    @IBOutlet weak var preparePaymentSwitch: UISwitch!
    @IBOutlet weak var vipRoomSwitch: UISwitch!
    @IBOutlet weak var nameClienttextField: UITextField!

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.booking = true
    }

    @IBAction func invoiceButton(_ sender: Any) {
        showAlert()
    }
    func checkSwitch() {
        bookingSwitch.isOn ? (model.booking = true) : (model.booking = false)
        preparePaymentSwitch.isOn ? (model.prepayment = true) : (model.prepayment = false)
        vipRoomSwitch.isOn ? (model.vipRomm = true) : (model.vipRomm = false)
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
        vc.bookingBool = model.booking
        vc.paymentBool = model.prepayment
        vc.vipBool = model.vipRomm
        vc.nameClient = nameClienttextField.text ?? ""
     
        self.present(vc, animated: true, completion: nil)
    }
}
