//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// В данном классе создаются все элементы для отображения и также прописана их логика
class ViewController: UIViewController {
    
    var labelName: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 80, width: 350, height: 60))
        label.numberOfLines = 0
        label.text = "Hello, !"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    var chooseGameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 150, width: 350, height: 70))
        label.numberOfLines = 0
        label.text = "Выбери игру в которую хочешь сыграть!"
        label.textColor = .black
        label.font = .systemFont(ofSize: 23)
        label.textAlignment = .center
        return label
    }()
    var sumNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 340, width: 350, height: 50))
        label.text = "Игра сложение двух чисел"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    var guessNumberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 500, width: 350, height: 60))
        label.numberOfLines = 0
        label.text = "Игра угадай число"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    var sumNumberButton: UIButton = {
        var button = UIButton(frame: CGRect(x: 20, y: 410, width: 350, height: 50))
        button.setTitle("Сложение чисел", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    var guessNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 580, width: 350, height: 50))
        button.setTitle("Угадай число", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    var showNewVC: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 680, width: 350, height: 50))
        button.setTitle("Перейти к app 'MVC'", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLabelView()
        addButtonView()
        showAddTarget()
    }
    
    func addLabelView() {
        self.view.backgroundColor = .yellow
        self.view.addSubview(labelName)
        self.view.addSubview(chooseGameLabel)
        self.view.addSubview(sumNumberLabel)
        self.view.addSubview(guessNumberLabel)
    }
    
    func addButtonView() {
        self.view.addSubview(guessNumberButton)
        self.view.addSubview(sumNumberButton)
        self.view.addSubview(showNewVC)
    }
    
    func showAddTarget() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
        sumNumberButton.addTarget(self, action: #selector(sumNumber), for: .allTouchEvents)
        guessNumberButton.addTarget(self, action: #selector(guessNumber), for: .allTouchEvents)
        showNewVC.addTarget(self, action: #selector(showVC), for: .allTouchEvents)
    }
    
    func showAlertHello() {
        let alert = UIAlertController(title: "Welcome", message: "В форме ниже введите свое ФИО",
                                      preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите ФИО"
        }
        let action = UIAlertAction(title: "Добавить", style: .default) { _ in
            self.labelName.text = "Hello, " + (alert.textFields?.first?.text ?? "Guest") + "!"
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @objc func applicationWillEnterForeground(notification: Notification) {
        showAlertHello()
    }
    
    @objc func showVC(sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "SecondViewController") as? SecondViewController else {return}
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func sumNumber(sender: UIButton) {
        var number1: String?
        var number2: String?
        let alert = UIAlertController(title: "Сложение чисел", message: "Добавьте число", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите первое число типа Int"
        }
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            number1 = alert.textFields?.first?.text
            
            let alertTwo = UIAlertController(title: "Сложение чисел", message: "Добавьте число", preferredStyle: .alert)
            alertTwo.addTextField { textField in
                textField.placeholder = "Введите второе число типа Int"
            }
            let addTwo = UIAlertAction(title: "Add", style: .default) { _ in
                number2 = alertTwo.textFields?.first?.text
                if let number1 = Int(number1 ?? ""), let number2 = Int(number2 ?? "") {
                    self.sumNumberLabel.text = "Сумма двух чисел равна = \(number1 + number2)"
                }
            }
            alertTwo.addAction(addTwo)
            self.present(alertTwo, animated: true)
            
        }
        alert.addAction(add)
        self.present(alert, animated: true)
        
    }
    @objc func guessNumber(sender: UIButton) {
        let random = Int.random(in: 0...100)
        
        let alertController = UIAlertController(title: "Random", message: "Введите число", preferredStyle: .alert)
        alertController.addTextField()
        
        let actionAdd = UIAlertAction(title: "Add", style: .default) { _ in
            let textField = alertController.textFields?.first?.text
            if random == Int(textField ?? "0") {
                self.guessNumberLabel.text = "Поздравляю, вы угадали, число - \(random)"
            } else {
                self.guessNumberLabel.text = "К сожалению вы не угадали, число \(random)"
            }
            self.guessNumberButton.setTitle("Попробуй еще раз", for: .normal)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.guessNumberButton.setTitle("Сыграем?", for: .normal)
        }
        
        alertController.addAction(actionAdd)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true)
    }
}
