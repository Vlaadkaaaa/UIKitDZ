//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 21.09.2022.
//

import UIKit

///
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // Переход к другому VC при помощи segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PlayerViewController else { return }
        if segue.identifier == "songOne" {
            destination.songArray.append((nameSong: "Симфония №5", nameArtist: "Бетхвен", nameImage: "betkhoven"))
        } else if segue.identifier == "songTwo" {
            destination.songArray.append((nameSong: "Выхода нет", nameArtist: "Сплин", nameImage: "splin"))
        }
    }
}
