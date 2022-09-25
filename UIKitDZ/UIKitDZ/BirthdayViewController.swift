//
//  BirthdayViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 23.09.2022.
//

import UIKit
/// В данном классе добавлены 3 контакта при помощи кода
class BirthdayViewController: UIViewController {
    // Contact 1
    var titleLabel: UILabel {
        let label = addLabel(pointX: 145, pointY: 20, width: 100, height: 30, text: "Birthday")
        label.font = .systemFont(ofSize: 24)
        return label
    }
    let imageUserOne: UIImageView = {
       let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        image.frame = CGRect(x: 5, y: 90, width: 55, height: 55)
        image.backgroundColor = .systemGray5
        image.tintColor = .systemGray
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    var nameOneLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 95, width: 100, height: 20, text: "Jeremy")
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }
    var textOneLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 115,
                             width: 300, height: 30,
                             text: "10 марта, в среду исполнится 25 лет")
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }
    var countDayToBirthdayOne: UILabel {
        let label = addLabel(pointX: 300, pointY: 95, width: 100, height: 20, text: "18 дней")
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }
    var lineViewOne: UIView {
        let view = addLine(pointX: 20, pointY: 155, width: 370, height: 1)
        return view
    }
    
    // Contact 2
    let imageUserTwo: UIImageView = {
       let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        image.frame = CGRect(x: 5, y: 170, width: 55, height: 55)
        image.backgroundColor = .systemGray5
        image.tintColor = .systemGray
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    var nameTwoLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 175, width: 100, height: 20, text: "Maria Lui")
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }
    var textTwoLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 195,
                             width: 300, height: 30,
                             text: "30 марта, в четверг исполнится 20 лет")
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }
    var countDayToBirthdayTwo: UILabel {
        let label = addLabel(pointX: 300, pointY: 175, width: 100, height: 20, text: "28 дней")
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }
    var lineViewTwo: UIView {
        let view = addLine(pointX: 20, pointY: 235, width: 370, height: 1)
        return view
    }
    
    // Contact 3
    let imageUserThree: UIImageView = {
       let image = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        image.frame = CGRect(x: 5, y: 250, width: 55, height: 55)
        image.backgroundColor = .systemGray5
        image.tintColor = .systemGray
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        return image
    }()
    var nameThreeLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 255, width: 100, height: 20, text: "Jony Stark")
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }
    var textThreeLabel: UILabel {
        let label = addLabel(pointX: 70, pointY: 275,
                             width: 300, height: 30,
                             text: "20 апреля, в субботу исполнится 25 лет")
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }
    var countDayToBirthdayThree: UILabel {
        let label = addLabel(pointX: 300, pointY: 255, width: 100, height: 20, text: "53 дней")
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        return label
    }
    var lineViewThree: UIView {
        let view = addLine(pointX: 20, pointY: 315, width: 370, height: 1)
        return view
    }
    
    var addNewUserButtonAction: UIButton = {
       var button = UIButton(frame: CGRect(x: 330, y: 20, width: 40, height: 40))
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(nameOneLabel)
        self.view.addSubview(textOneLabel)
        self.view.addSubview(imageUserOne)
        self.view.addSubview(countDayToBirthdayOne)
        self.view.addSubview(lineViewOne)

        self.view.addSubview(nameTwoLabel)
        self.view.addSubview(textTwoLabel)
        self.view.addSubview(imageUserTwo)
        self.view.addSubview(countDayToBirthdayTwo)
        self.view.addSubview(lineViewTwo)
        
        self.view.addSubview(nameThreeLabel)
        self.view.addSubview(textThreeLabel)
        self.view.addSubview(imageUserThree)
        self.view.addSubview(countDayToBirthdayThree)
        self.view.addSubview(lineViewThree)
        
        self.view.addSubview(addNewUserButtonAction)
        addNewUserButtonAction.addTarget(self, action: #selector(addNewContact), for: .allTouchEvents)
        
    }
    
    func addLine(pointX: Int, pointY: Int, width: Int, height: Int) -> UIView {
    let view = UIView(frame: CGRect(x: pointX, y: pointY, width: width, height: height))
        view.backgroundColor = .systemGray4
        return view
    }
    func addLabel(pointX: Int, pointY: Int, width: Int, height: Int, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: pointX, y: pointY, width: width, height: height))
        label.text = text
        return label
    }
    
    @objc func addNewContact() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "addInfoVC") as? AddInfoViewController else {return}
        self.present(vc, animated: true, completion: nil)
    }
}
