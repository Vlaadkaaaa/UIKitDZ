//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
final class ViewController: UIViewController {
    
    // MARK: - Visual Components
    private var editBoldFontButton: UIButton {
        let button = UIButton(frame: CGRect(x: 25, y: 65, width: 30, height: 50))
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 40)
        button.setTitleColor(.black, for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editNonBoldFontButton: UIButton {
        let button = UIButton(frame: CGRect(x: 60, y: 65, width: 30, height: 50))
        button.setTitle("a", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.setTitleColor(.black, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editRedColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 120, y: 65, width: 50, height: 50))
        button.backgroundColor = .systemRed
        button.tag = 2
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editGreenColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 160, y: 65, width: 50, height: 50))
        button.tag = 3
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editBlueColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 200, y: 65, width: 50, height: 50))
        button.tag = 4
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editBlackColorButton: UIButton {
        let button = UIButton(frame: CGRect(x: 240, y: 65, width: 50, height: 50))
        button.tag = 5
        button.backgroundColor = .black
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(editFontAction), for: .allTouchEvents)
        return button
    }
    private var editSizeTextSlider: UISlider {
        let slider = UISlider(frame: CGRect(x: 30, y: 140, width: 330, height: 30))
        slider.minimumValue = 10
        slider.maximumValue = 48
        slider.value = 20
        slider.addTarget(self, action: #selector(changeSliderAction), for: .valueChanged)
        return slider
    }
    private var textView: UITextView = {
        var textView = UITextView(frame: CGRect(x: 30, y: 180, width: 330, height: 330))
        textView.backgroundColor = .lightGray
        textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    private let fontPickerView: UIPickerView = {
        var pickerView = UIPickerView(frame: CGRect(x: 112.5, y: 600, width: 165, height: 100))
        return pickerView
    }()

    // MARK: - Private Properties
   private let nameFonts = ["Arial", "Copperplate", "Georgia", "Zapfino"]
    private var nameFont = ""
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNewViewElement()
        fontPickerView.delegate = self
        fontPickerView.dataSource = self
    }
    
    // MARK: - Private Methods
    private func showNewViewElement() {
        view.addSubview(editRedColorButton)
        view.addSubview(editGreenColorButton)
        view.addSubview(editBlueColorButton)
        view.addSubview(editBlackColorButton)
        
        view.addSubview(editBoldFontButton)
        view.addSubview(editNonBoldFontButton)
        
        view.addSubview(editSizeTextSlider)
        
        view.addSubview(textView)
        
        view.addSubview(fontPickerView)
    }
    
    @objc private func editFontAction(sender: UIButton) {
        switch sender.tag {
        case 0: textView.font = UIFont(name: nameFont + "-Bold", size: 20)
        case 1: textView.font = UIFont(name: nameFont, size: 20)
        case 2: textView.textColor = .systemRed
        case 3: textView.textColor = .systemGreen
        case 4: textView.textColor = .systemBlue
        case 5: textView.textColor = .black
        default: break
        }
    }
    
    @objc private func changeSliderAction(sender: UISlider) {
        textView.font = UIFont(name: nameFont, size: CGFloat(sender.value))
    }
    // MARK: - Constants
    
}
// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nameFonts.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nameFonts[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameFont = nameFonts[row]
        textView.font = UIFont(name: nameFont, size: 20)
    }
    
}
