//
//  AddInfoViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 25.09.2022.
//

import UIKit
///
class AddInfoViewController: UIViewController {
    
    let addUserButtonAction: UIButton = {
        var button = UIButton(frame: CGRect(x: 280, y: 20, width: 90, height: 40))
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(UIColor(cgColor: CGColor(red: 40/255,
                                                      green: 100/255, blue: 240/255,
                                                      alpha: 1.0)), for: .normal)
       
        return button
    }()
    let userImage: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
         image.frame = CGRect(x: 135, y: 65, width: 120, height: 120)
         image.backgroundColor = .systemGray5
         image.tintColor = .systemGray
         image.layer.cornerRadius = image.frame.size.width / 2
         image.clipsToBounds = true
        
        return image
    }()
    
    let editPhotoButtonAction: UIButton = {
       let button = UIButton(frame: CGRect(x: 120, y: 195, width: 150, height: 30))
        button.setTitle("Изменить фото", for: .normal)
        button.setTitleColor(UIColor(cgColor: CGColor(red: 40/255,
                                                      green: 100/255, blue: 240/255,
                                                      alpha: 1.0)), for: .normal)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 260, width: 350, height: 20))
        label.text = "Name"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 280, width: 310, height: 40))
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    let dateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 340, width: 310, height: 20))
        label.text = "Дата"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var dateTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 360, width: 310, height: 40))
        textField.placeholder = "Введите дату"
        textField.borderStyle = .roundedRect
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
  
    let ageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 420, width: 310, height: 20))
        label.text = "Возраст"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var ageTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 440, width: 310, height: 40))
        textField.placeholder = "Добавить"
        textField.borderStyle = .roundedRect
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    
    let sexLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 500, width: 310, height: 20))
        label.text = "Пол"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var sexTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 520, width: 310, height: 40))
        textField.placeholder = "Добавить"
        textField.borderStyle = .roundedRect
        textField.setBottomBorder(color: .systemGray5)
        return textField
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 580, width: 310, height: 20))
        label.text = "Instagram"
        label.textColor = UIColor(cgColor: CGColor(red: 40/255, green: 100/255, blue: 240/255, alpha: 0.6))
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    var instagramButtonAction: UIButton {
        let button = UIButton(frame: CGRect(x: 30, y: 600, width: 310, height: 40))
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemGray3, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(showInstagramAlert), for: .allTouchEvents)
        return button
    }
    
    let sex = ["male", "female"]
    let agePicker = UIPickerView()
    let sexPicker = UIPickerView()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(nameLabel)
        self.view.addSubview(userImage)
        self.view.addSubview(nameTextField)
        self.view.addSubview(dateLabel)
        self.view.addSubview(dateTextField)
        self.view.addSubview(ageLabel)
        self.view.addSubview(ageTextField)
        self.view.addSubview(sexLabel)
        self.view.addSubview(sexTextField)
        self.view.addSubview(instagramLabel)
        self.view.addSubview(instagramButtonAction)
        self.view.addSubview(addUserButtonAction)
        self.view.addSubview(editPhotoButtonAction)
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels

        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        dateTextField.inputView = datePicker

        ageTextField.inputView = agePicker
        agePicker.tag = 0
        agePicker.dataSource = self
        agePicker.delegate = self
        
        sexTextField.inputView = sexPicker
        sexPicker.tag = 1
        sexPicker.dataSource = self
        sexPicker.delegate = self
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func showInstagramAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Введите username Instagram", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.instagramButtonAction.setTitle(alert.textFields?.first?.text, for: .normal)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addTextField { textField in
            textField.placeholder = "Например vlaadkaaaa"
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        self.present(alert, animated: true)
        return alert
    }
    
}

extension AddInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return 100
        case 1: return sex.count
        default: return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return "\(row)"
        case 1: return sex[row]
        default: return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: ageTextField.text = "\(row)"
        case 1: sexTextField.text = sex[row]
        default: break
        }
    }
}
