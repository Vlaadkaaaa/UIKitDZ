//
//  Users.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import Foundation
/// Хранение пользователей
struct Users {
    // MARK: - Public Property
    var users = [(surname: "Lymar", name: "Vlad", login: "vladka", password: "vladka")]
    
    // MARK: - Private Property
    private var surname: String?
    private var name: String?
    private var login: String?
    private var password: String?
     
    var userDefaults = UserDefaults.standard
    
    mutating func addNewUser(surname: String, name: String, login: String, password: String) {
        for user in users {
            if user.login == login {
                return
            } else {
                users.append((surname: surname, name: name, login: login, password: password))
            }
        }
    }
}
