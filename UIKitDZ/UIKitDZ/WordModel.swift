//
//  Model.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 22.09.2022.
//

import Foundation
/// Данная модель конвертирует введенный пользователем текст и возвращает его в измененном формате
struct Words {
    func converting(text: String) -> String {
        guard text == "leohl" else {return "Не знаю что за \(text)"}
        return "Hello"
    }
}
