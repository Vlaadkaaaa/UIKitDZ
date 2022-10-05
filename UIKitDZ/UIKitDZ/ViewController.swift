//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Редактирование текста  в TextView
final class ViewController: UIViewController {
    
    private enum Constants {
        static let titleBoldFont = "A"
        static let titleNonBoldFont = "a"
        static let sizeFont = 20
        static let slideValue = (min: Float(10), max: Float(50), value: Float(20))
        static let colors = [UIColor.systemRed, UIColor.systemGreen, UIColor.systemBlue, UIColor.black]
        static let nameFonts = ["Arial", "Copperplate", "Georgia", "Zapfino"]
    }
    // MARK: - Visual Components
    private lazy var editBoldFontButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 25, y: 65, width: 30, height: 50))
        button.setTitle(Constants.titleBoldFont, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 40)
        button.setTitleColor(.black, for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }()
    private lazy var editNonBoldFontButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 60, y: 65, width: 30, height: 50))
        button.setTitle(Constants.titleNonBoldFont, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.black, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }()
    private var editRedColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 120, y: 65, width: 50, height: 50))
        button.backgroundColor = Constants.colors[0]
        button.tag = 2
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editGreenColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 160, y: 65, width: 50, height: 50))
        button.tag = 3
        button.backgroundColor = Constants.colors[1]
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editBlueColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 200, y: 65, width: 50, height: 50))
        button.tag = 4
        button.backgroundColor = Constants.colors[2]
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private let editBlackColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 240, y: 65, width: 50, height: 50))
        button.tag = 5
        button.backgroundColor = Constants.colors[3]
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private let editSizeTextSlider: UISlider {
        let slider = UISlider(frame: CGRect(x: 30, y: 140, width: 330, height: 30))
        slider.minimumValue = Constants.slideValue.min
        slider.maximumValue = Constants.slideValue.max
        slider.value = Constants.slideValue.value
        slider.addTarget(self, action: #selector(changeSliderAction), for: .valueChanged)
        return slider
    }
    private let textView: UITextView = {
        var textView = UITextView(frame: CGRect(x: 30, y: 180, width: 330, height: 330))
        textView.backgroundColor = .lightGray
        textView.font = .systemFont(ofSize: 20)
        textView.text = """
Нам, учитель дорогой,
Ваш характер нравится!
Кроме Вас, никто другой
С нами не управится!

Вы - добры и справедливы!
Вы - во всем пример для нас!
Самых лучших чувств порывы
Выражает Вам наш класс!
"""
        return textView
    }()
    private let fontPickerView: UIPickerView = {
        var pickerView = UIPickerView(frame: CGRect(x: 112.5, y: 600, width: 165, height: 100))
        return pickerView
    }()
    private let themeBlackSwitch: UISwitch = {
        let themeSwicth = UISwitch(frame: CGRect(x: 180, y: 750, width: 0, height: 0))
        
        return themeSwicth
    }()
    
    // MARK: - Private Properties
    private var nameFont = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewViewElementAndTarget()
        
    }
    
    // MARK: - Private Methods
    private func showNewViewElementAndTarget() {
        view.addSubview(editRedColorButton)
        view.addSubview(editGreenColorButton)
        view.addSubview(editBlueColorButton)
        view.addSubview(editBlackColorButton)
        view.addSubview(editBoldFontButton)
        view.addSubview(editNonBoldFontButton)
        view.addSubview(editSizeTextSlider)
        view.addSubview(textView)
        view.addSubview(fontPickerView)
        view.addSubview(themeBlackSwitch)
        
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
        
        themeBlackSwitch.addTarget(self, action: #selector(changeSwitchAction), for: .valueChanged)
    }
    
    @objc private func editFontAction(sender: UIButton) {
        switch sender.tag {
        case 0: textView.font = UIFont(name: nameFont + "-Bold", size: CGFloat(editSizeTextSlider.value))
        case 1: textView.font = UIFont(name: nameFont, size: CGFloat(Constants.sizeFont))
        case 2: textView.textColor = Constants.colors[0]
        case 3: textView.textColor = Constants.colors[1]
        case 4: textView.textColor = Constants.colors[2]
        case 5: textView.textColor = Constants.colors[3]
        default: break
        }
    }
    
    @objc private func changeSliderAction(sender: UISlider) {
        textView.font = UIFont(name: nameFont, size: CGFloat(sender.value))
    }
    
    @objc private func changeSwitchAction(sender: UISwitch) {
        if sender.isOn {
            changeColor(backgroungColor: .black, color: .white)
        } else {
            changeColor(backgroungColor: .white, color: .black)
        }
    }
    
    private func changeColor(backgroungColor: UIColor, color: UIColor) {
        view.backgroundColor = backgroungColor
        editBoldFontButton.setTitleColor(color, for: .normal)
        editNonBoldFontButton.setTitleColor(color, for: .normal)
        fontPickerView.setValue(color, forKey: "textColor")
    }
    
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.nameFonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.nameFonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameFont = Constants.nameFonts[row]
        textView.font = UIFont(name: nameFont, size: 20)
    }
}
