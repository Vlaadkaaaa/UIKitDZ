//
//  AddAlarmViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 30.09.2022.
//

import UIKit
/// Добавление/Редактирование будильника
final class AddAlarmViewController: UIViewController {
    
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var timePickerViewOutlet: UIDatePicker!
    @IBOutlet weak var addNameAlarmTextField: UITextField!
    
    weak var delegate: AlarmViewControllerDelegate?
    private let timeStartFormatter = DateFormatter()
    private var date = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewViewElement()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        timeStartFormatter.dateFormat = "HH:mm"
        date = timeStartFormatter.string(from: timePickerViewOutlet.date)
        print(date)
        
        delegate?.update(alarmTime: "\(date)",
                         alarmName: addNameAlarmTextField.text ?? "Будильник")
        dismiss(animated: true)
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    private func showNewViewElement() {
        timePickerViewOutlet.setValue(UIColor.white, forKeyPath: "textColor")
        viewOutlet.layer.cornerRadius = 20
        title = "Add Alarm"
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
    }
}
