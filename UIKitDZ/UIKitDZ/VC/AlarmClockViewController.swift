//
//  AlarmClockViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 30.09.2022.
//

import UIKit
/// Protocol
protocol AlarmViewControllerDelegate: AnyObject {
    func update(alarmTime: String, alarmName: String)
}
/// Активация/Добавление будильника
final class AlarmClockViewController: UIViewController {
    
    // MARK: - Private Visual Component
    @IBOutlet private weak var settingsOutlet: UIButton!
    @IBOutlet private weak var alarmOneOutlet: UIButton!
    @IBOutlet private weak var oneAlarmTimeOutlet: UILabel!
    @IBOutlet private weak var twoAlarmTimeOutlet: UILabel!
    @IBOutlet private weak var threeAlarmTimeOutlet: UILabel!
    @IBOutlet private weak var editAlarmOutlet: UIBarButtonItem!
    @IBOutlet private weak var oneAlarmSwitchOutlet: UISwitch!
    @IBOutlet private weak var nameAlarmOneLabel: UILabel!
    @IBOutlet private weak var fourAlarmTimeOutlet: UILabel!
    @IBOutlet private weak var nameAlarmFourLabel: UILabel!
    @IBOutlet private weak var fourAlarmSwitchOutlet: UISwitch!
    @IBOutlet private weak var fourAlarmView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewElement()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddAlarmViewController else { return }
        destination.delegate = self
    }
    
    // MARK: - IBAction
    @IBAction func editAlarmAction(_ sender: Any) {
        if alarmOneOutlet.isEnabled {
            editAlarmOutlet.title = "Править"
            alarmOneOutlet.isEnabled = false
            changeTime(color: .systemGray)
        } else {
            editAlarmOutlet.title = "Отмена"
            alarmOneOutlet.isEnabled = true
            changeTime(color: .white)
        }
    }
    
    @IBAction func alarmOneAction(_ unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func oneAlarmSwitchAction(_ sender: Any) {
        if oneAlarmSwitchOutlet.isOn {
            oneAlarmTimeOutlet.textColor = .white
            nameAlarmOneLabel.textColor = .white
        } else {
            oneAlarmTimeOutlet.textColor = .systemGray
            nameAlarmOneLabel.textColor = .systemGray
        }
    }
    
    // MARK: - Private Method
    private func showViewElement() {
        settingsOutlet.layer.cornerRadius = 20
        alarmOneOutlet.isEnabled = false
        isHiddenNewAlarm(isValue: true)
    }
    
    private func changeTime(color: UIColor) {
        oneAlarmTimeOutlet.textColor = color
        twoAlarmTimeOutlet.textColor = color
        threeAlarmTimeOutlet.textColor = color
        fourAlarmTimeOutlet.textColor = color
    }
    private func isHiddenNewAlarm(isValue: Bool) {
        nameAlarmFourLabel.isHidden = isValue
        fourAlarmTimeOutlet.isHidden = isValue
        fourAlarmSwitchOutlet.isHidden = isValue
        fourAlarmView.isHidden = isValue
    }
}

// MARK: - AlarmViewControllerDelegate
extension AlarmClockViewController: AlarmViewControllerDelegate {
    func update(alarmTime: String, alarmName: String) {
        isHiddenNewAlarm(isValue: false)
        fourAlarmTimeOutlet.text = alarmTime
        nameAlarmFourLabel.text = alarmName
    }
}
