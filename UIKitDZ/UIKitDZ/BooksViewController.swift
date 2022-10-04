//
//  BooksViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import UIKit
/// Список книг в библиотеке 
final class BooksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       showViewElement()
    }
    
    // MARK: - Private Method
    private func showViewElement() {
        view.backgroundColor = .gray
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    }
    
}
