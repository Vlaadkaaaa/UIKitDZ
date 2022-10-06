//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
final class ViewController: UIViewController {
  
    // MARK: - IBOutlet
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var startOutlet: UIButton!
    
    // MARK: - Private Properties
    private var timer: Timer?
    private var currentTime: Float = 0.0
    // MARK: - Initializers
    
    // MARK: - UIViewController (*)
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func resetAction(_ sender: Any) {
    }
    @IBAction func startAction(_ sender: Any) {
        startTimer()
    }
    // MARK: - Private Methods
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self, selector: #selector(updateTimer),
                                    userInfo: nil, repeats: true)
    }
    @objc private func updateTimer(sender: Timer) {
        currentTime += Float(sender.timeInterval)
    }
    private func updateLabel() {
        timerLabel.text = "\(currentTime)"
    }
    // MARK: - Types
    
    // MARK: - Constants
    
}
