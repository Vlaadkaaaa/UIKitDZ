//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
class ViewController: UIViewController {
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?
    var pickerView = UIPickerView()
    var textFieldForPikcerView = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldForPikcerView.borderStyle = .line
        self.view.addSubview(textFieldForPikcerView)
        createTextField()
        createButton()
    }
    // MARK: - Method
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Enter text to share"
        self.view.addSubview(textField)
    }
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 500, width: 200, height: 44)
        self.buttonShare.setTitle("Расшарить", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        self.view.addSubview(self.buttonShare)
    }
    func createPickerView() {
        self.pickerView = UIPickerView(frame: CGRect(x: 50, y: 100, width: 300, height: 30))
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.textField.inputView = pickerView
    }
    func showActivityVC() {
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? ""],
                                                               applicationActivities: nil)
        guard let activityViewController = self.activityViewController else {return}
        self.present(activityViewController, animated: true)
    }
    @objc func handleShare(paramSender: Any) {
        let text = self.textField.text
        if text?.count == 0 {
            let message = "Сначала введите текст потом нажмите кнопку"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        showActivityVC()
    }
}

extension UIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 3 {
    
        }
        return "\(row)"
    }
}
