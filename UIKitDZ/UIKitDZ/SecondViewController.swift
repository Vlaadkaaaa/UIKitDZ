//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import UIKit

///
class SecondViewController: UIViewController {
    private var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(startButton)
        self.view.addSubview(presentTextlabel)
        
        startButton.addTarget(self, action: #selector(start), for: .allTouchEvents)

    }
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
    
    @objc func start(sender: UIButton) {
        let alert = UIAlertController(title: "Введите слово", message: "", preferredStyle: .alert)
        alert.addTextField()
        let add = UIAlertAction(title: "Ok", style: .default) { _ in
            self.presentTextlabel.text = self.model.converting(text: alert.textFields?.first?.text ?? "")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(add)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
}
