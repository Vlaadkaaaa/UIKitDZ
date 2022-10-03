//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Добавление и редактирование текста
final class EditTextViewController: UIViewController {
    private var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 200, width: 310, height: 200))
        label.text = "The Swift Developers"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byCharWrapping
        label.shadowColor = .systemRed
        label.shadowOffset = CGSize(width: 1, height: 1)
        return label
    }()
    private var boldSwitch: UISwitch = {
        let boldSwitch = UISwitch(frame: CGRect(x: 300, y: 100, width: 0, height: 0))
        
        return boldSwitch
    }()
    private var linePicker: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(x: 50, y: 500, width: 100, height: 100))
        picker.tag = 0
        picker.backgroundColor = .systemBlue
        return picker
    }()
    private var colorPicker: UIPickerView = {
        var picker = UIPickerView(frame: CGRect(x: 250, y: 500, width: 100, height: 100))
        picker.tag = 1
        picker.backgroundColor = .systemGreen
        return picker
    }()
    private var textSizeSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 50, y: 670, width: 310, height: 30))
        slider.minimumValue = 5
        slider.value = 30
        slider.maximumValue = 72
        return slider
    }()
    
    private var colorsName = ["black", "green", "blue", "red"]
    private var colors = [UIColor.black, UIColor.systemGreen, UIColor.systemBlue, UIColor.systemRed]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewElementandAction()
    }
    
    private func showViewElementandAction() {
        title = "Edit Text"
        tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        tabBarItem.image = UIImage(named: "pencil")
        view.addSubview(textLabel)
        view.addSubview(linePicker)
        view.addSubview(colorPicker)
        view.addSubview(boldSwitch)
        view.addSubview(textSizeSlider)
        
        textSizeSlider.addTarget(self, action: #selector(changeSliderAction), for: .valueChanged)
        boldSwitch.addTarget(self, action: #selector(changeSwitchAction), for: .valueChanged)
        linePicker.delegate = self
        linePicker.dataSource = self
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(shoAlertAction))
    }
    @objc private func changeSwitchAction() {
        if boldSwitch.isOn {
            textLabel.font = .boldSystemFont(ofSize: 25)
        } else {
            textLabel.font = .systemFont(ofSize: 25)
        }
    }
    @objc private func shoAlertAction() {
        let alertController = UIAlertController(title: "Введите текст", message: "", preferredStyle: .alert)
        alertController.addTextField()
        let alertAddAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else { return }
            self.textLabel.text = text
        }
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(alertAddAction)
        alertController.addAction(alertCancelAction)
        
        present(alertController, animated: true)
    }
    @objc private func changeSliderAction() {
        textLabel.font = textLabel.font.withSize(CGFloat(textSizeSlider.value))
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension EditTextViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return "\(row)"
        } else {
            return colorsName[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            textLabel.numberOfLines = row
        } else {
            textLabel.textColor = colors[row]
        }
    }
    
}
