//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

/// Contraints задаются через Storyboard
final class StoryboardViewController: UIViewController {
    
    // MARK: Private Constant
    private enum Constants {
        static let title = "Storyboard ViewController"
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
    }
}
