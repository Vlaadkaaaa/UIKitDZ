//
//  Users.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 03.10.2022.
//

import Foundation
///
struct Users {
    private var surname: String?
    private var name: String?
    private var login: String?
    private var password: String?
    
    var users = [(surname: "Lymar", name: "Vlad", login: "vladka", password: "vladka")]
    
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
