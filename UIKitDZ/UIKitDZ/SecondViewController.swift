//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import UIKit

/// Данный VC добавляет элементы на второй экран приложения, модель вынесена в отдельный файл WordModel
class SecondViewController: UIViewController {
    
    var presentTextlabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 350, height: 60))
        label.text = "Текст полученный после конвертации"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: 350, height: 50))
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()
    
    private var words = Words()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        startButton.addTarget(self, action: #selector(startAction), for: .allTouchEvents)
    }
    
    func addView() {
        view.backgroundColor = .systemYellow
        view.addSubview(startButton)
        view.addSubview(presentTextlabel)
    }
    
    @objc func startAction(sender: UIButton) {
        let alert = UIAlertController(title: "Введите слово", message: "", preferredStyle: .alert)
        alert.addTextField()
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.presentTextlabel.text = self.words.converting(text: alert.textFields?.first?.text ?? "")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(alertAction)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
}
