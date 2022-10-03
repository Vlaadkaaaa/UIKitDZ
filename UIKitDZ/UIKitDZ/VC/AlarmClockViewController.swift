//
//  AlarmClockViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 30.09.2022.
//

import UIKit
///
protocol AlarmViewControllerDelegate: AnyObject {
    func update(alarmTime: String, alarmName: String)
}
/// Активация/Добавление будильника
final class AlarmClockViewController: UIViewController {
    
    @IBOutlet weak var settingsOutlet: UIButton!
    @IBOutlet weak var alarmOneOutlet: UIButton!
    @IBOutlet weak var oneAlarmTimeOutlet: UILabel!
    @IBOutlet weak var twoAlarmTimeOutlet: UILabel!
    @IBOutlet weak var threeAlarmTimeOutlet: UILabel!
    @IBOutlet weak var editAlarmOutlet: UIBarButtonItem!
    @IBOutlet weak var oneAlarmSwitchOutlet: UISwitch!
    @IBOutlet weak var nameAlarmOneLabel: UILabel!
    @IBOutlet weak var fourAlarmTimeOutlet: UILabel!
    @IBOutlet weak var nameAlarmFourLabel: UILabel!
    @IBOutlet weak var fourAlarmSwitchOutlet: UISwitch!
    @IBOutlet weak var fourAlarmView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsOutlet.layer.cornerRadius = 20
        alarmOneOutlet.isEnabled = false
        isHiddenNewAlarm(isValue: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddAlarmViewController else { return }
        destination.delegate = self
    }
    
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
extension AlarmClockViewController: AlarmViewControllerDelegate {
    func update(alarmTime: String, alarmName: String) {
        isHiddenNewAlarm(isValue: false)
        fourAlarmTimeOutlet.text = alarmTime
        nameAlarmFourLabel.text = alarmName
    }
}
