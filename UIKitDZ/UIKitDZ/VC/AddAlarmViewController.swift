//
//  AddAlarmViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 30.09.2022.
//

import UIKit
/// Добавление/Редактирование будильника
final class AddAlarmViewController: UIViewController {
    
    // MARK: - Private Visual Component
    @IBOutlet private weak var viewOutlet: UIView!
    @IBOutlet private weak var timePickerViewOutlet: UIDatePicker!
    @IBOutlet private weak var addNameAlarmTextField: UITextField!
    
    // MARK: - Private Property
    private let timeStartFormatter = DateFormatter()
    private var date = String()
    
    // MARK: - Delegate
    weak var delegate: AlarmViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewViewElement()
    }
    
    // MARK: - IBAction
    @IBAction func saveAction(_ sender: Any) {
        timeStartFormatter.dateFormat = "HH:mm"
        date = timeStartFormatter.string(from: timePickerViewOutlet.date)
        
        delegate?.update(alarmTime: "\(date)",
                         alarmName: addNameAlarmTextField.text ?? "Будильник")
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    // MARK: - Private Method
    private func showNewViewElement() {
        timePickerViewOutlet.setValue(UIColor.white, forKeyPath: "textColor")
        viewOutlet.layer.cornerRadius = 20
        title = "Add Alarm"
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
    }
}
