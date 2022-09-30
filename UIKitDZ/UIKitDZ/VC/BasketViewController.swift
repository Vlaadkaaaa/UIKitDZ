//
//  BasketViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 26.09.2022.
//

import UIKit
/// Данный VC предназначет для создания корзины в интернет магазине
class BasketViewController: UIViewController {
    
    var logoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 50, width: 100, height: 20 ))
        label.text = "Stepn"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    let chooseSneakersLogoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 90, width: 330, height: 20))
        label.text = "Сегодня вы заказали"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    var nameSneakersLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 150, width: 200, height: 20))
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Name's Sneakers:"
        return label
    }()
    var nameChooseSneakersLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 190, width: 100, height: 20))
        return label
    }()
    var sizeSneakersLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 250, width: 100, height: 20))
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Size shoe:"
        return label
    }()
    var sizeChooseSneakersLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 290, width: 100, height: 20))
        return label
    }()
    var imageSneakersView: UIImageView {
        let image = UIImageView(frame: CGRect(x: 95, y: 400, width: 200, height: 235))
        image.image = UIImage(named: nameSneakers)
        return image
    }
    
    var nameSneakers = String()
    var sizeSnikers = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewViewElement()
        nameChooseSneakersLabel.text = nameSneakers.capitalized
        sizeChooseSneakersLabel.text = "\(sizeSnikers)"
    }
}
extension BasketViewController {
    func addNewViewElement() {
        view.addSubview(logoLabel)
        view.addSubview(chooseSneakersLogoLabel)
        view.addSubview(nameSneakersLabel)
        view.addSubview(nameChooseSneakersLabel)
        view.addSubview(sizeSneakersLabel)
        view.addSubview(sizeChooseSneakersLabel)
        view.addSubview(imageSneakersView)
    }
}
