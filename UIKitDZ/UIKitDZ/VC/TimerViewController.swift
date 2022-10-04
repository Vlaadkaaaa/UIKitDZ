//
//  TimerViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 30.09.2022.
//

import UIKit
/// Создание/редактирование таймера
final class TimerViewController: UIViewController {
    
    // MARK - Private Visual Component
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var timerPickerView: UIPickerView!
    @IBOutlet private weak var editSongButton: UIButton!
    
    private var hour = 0
    private var minutes = 0
    private var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewVCElementAndAction()
    }
    
    // MARK: - Private Method
    private func showNewVCElementAndAction() {
        startButton.layer.cornerRadius = startButton.frame.height / 2
        cancelButton.layer.cornerRadius = cancelButton.frame.height / 2
        
        timerPickerView.setValue(UIColor.white, forKeyPath: "textColor")
        editSongButton.layer.cornerRadius = 20
        timerPickerView.delegate = self
        timerPickerView.dataSource = self
    }
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return 24
        case 1, 2: return 60
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return "\(row) с"
        case 1: return "\(row) мин"
        case 2: return "\(row) сек"
        default: return ""
        }
    }
}
