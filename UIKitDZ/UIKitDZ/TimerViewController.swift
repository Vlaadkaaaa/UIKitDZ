//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Timer
final class TimerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var startOutlet: UIButton!
    
    // MARK: - Private Properties
    private var timer = Timer()
    private var isStart = false
    private var currentTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func resetAction(_ sender: Any) {
        currentTime = 0
        updateTime()
    }
    
    @IBAction func startAction(_ sender: Any) {
        if !isStart {
            isStart = true
            startOutlet.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                              target: self, selector: #selector(updateTime),
                                              userInfo: nil, repeats: true)
        } else {
            isStart = false
            startOutlet.setTitle("Start", for: .normal)
             timer.invalidate()
        }
    }
    
    // MARK: - Private Methods
    @objc private func updateTime() {
        if !isStart {
            let timeStr = String(format: "%02d:%02d", 0, 0)
            timerLabel.text = timeStr
        } else {
            currentTime += 1
            let timeStr = String(format: "%02d:%02d", (currentTime / 100 ) % 60, currentTime % 100)
            timerLabel.text = timeStr
        }
    }
}
