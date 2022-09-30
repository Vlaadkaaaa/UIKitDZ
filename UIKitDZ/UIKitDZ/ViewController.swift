//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var defaultTextLabel: UILabel!
    @IBOutlet weak var defaultLabelTextTwo: UILabel!
    
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewElementsAndAction()
    }
    
    // MARK: - Method
    func createTextField() {
        textField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textField.center = self.view.center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text to share"
        view.addSubview(textField)
    }
    func createButton() {
        buttonShare = UIButton(type: .roundedRect)
        buttonShare.frame = CGRect(x: 50, y: 500, width: 290, height: 44)
        buttonShare.setTitle("Расшарить", for: .normal)
        buttonShare.addTarget(self, action: #selector(handleShareAction), for: .touchUpInside)
        view.addSubview(buttonShare)
    }

    func showActivityVC() {
        activityViewController = UIActivityViewController(activityItems: [textField.text ?? ""],
                                                               applicationActivities: nil)
        guard let activityViewController = activityViewController else { return }
        present(activityViewController, animated: true)
    }
    @objc func handleShareAction(paramSender: Any) {
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
    private func showViewElementsAndAction() {
        defaultTextLabel.textColor = .systemBlue
        defaultLabelTextTwo.textColor = .systemBlue
        pickerView.delegate = self
        pickerView.dataSource = self
        createTextField()
        createButton()
    }
}
/// UIPickerViewDelegate, UIPickerViewDataSource
extension UIViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            let activityViewController = UIActivityViewController(activityItems: ["Вы делитесь индексом №\(row)"],
                                                                applicationActivities: nil)
            self.present(activityViewController, animated: true)
        }
    }
}
