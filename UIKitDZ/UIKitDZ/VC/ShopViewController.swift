//
//  ShopViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 26.09.2022.
//

import UIKit
///
class ShopViewController: UIViewController {
    
    var logoLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 50, width: 100, height: 20 ))
        label.text = "Stepn"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    var backgroundSwitch: UISwitch {
        let backSwitch = UISwitch(frame: CGRect(x: 320, y: 30, width: 0, height: 0))
        backSwitch.onTintColor = .white
        backSwitch.isOn = false
        backSwitch.addTarget(self, action: #selector(reverseBacgroundColor), for: .valueChanged)
        return backSwitch
    }
    let textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 75, width: 310, height: 90))
        label.text = "Для того чтобы сделать заказ выберите интересующие вас кроссовки и подходящий размер"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 95, y: 165, width: 200, height: 235))
        image.image = UIImage(named: "walker")
        return image
    }()
    let borderView: UIView = {
        let view = UIView(frame: CGRect(x: 94, y: 164, width: 202, height: 237))
        view.backgroundColor = .black
        return view
    }()
    var nameSegmentedControl: UISegmentedControl = {
        let sneakersNameArray = ["walker", "trainer", "runner"]
        let segmentedControl = UISegmentedControl(items: sneakersNameArray)
        segmentedControl.frame = CGRect(x: 95, y: 435, width: 200, height: 30)
        return segmentedControl
    }()
    var sizeSegmentedControl: UISegmentedControl {
        let sizeSneakersArray = ["41", "42", "43", "44", "45"]
        let segmentedControl = UISegmentedControl(items: sizeSneakersArray)
        segmentedControl.frame = CGRect(x: 95, y: 485, width: 200, height: 30)
        return segmentedControl
    }
    var buyAction: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 570, width: 330, height: 40))
        button.backgroundColor = .systemRed
        button.setTitle("Купить", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let sneakersArray = [UIImage(named: "walker"),
                         UIImage(named: "trainer"),
                         UIImage(named: "runner")]
    var userDataArray = [(name: String, size: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(logoLabel)
        self.view.addSubview(textLabel)
        self.view.addSubview(backgroundSwitch)
        self.view.addSubview(borderView)
        self.view.addSubview(imageView)
        self.view.addSubview(nameSegmentedControl)
        self.view.addSubview(sizeSegmentedControl)
        self.view.addSubview(buyAction)
        
        nameSegmentedControl.addTarget(self, action: #selector(changeImageSneakers), for: .valueChanged)
        buyAction.addTarget(self, action: #selector(showBasketVC), for: .allTouchEvents)
    }
    @objc func reverseBacgroundColor(target: UISwitch) {
        if target.isOn {
            self.view.backgroundColor = .black
            self.textLabel.textColor = .white
            self.nameSegmentedControl.backgroundColor = .white
            self.sizeSegmentedControl.backgroundColor = .white
        } else {
            self.view.backgroundColor = .white
            self.textLabel.textColor = .black
        }
    }
    @objc func changeImageSneakers(target: UISegmentedControl) {
        if target == self.nameSegmentedControl {
            let segmentedIndex = target.selectedSegmentIndex
            self.imageView.image = self.sneakersArray[segmentedIndex]
            guard let name = target.titleForSegment(at: segmentedIndex) else { return }
            let size = sizeSegmentedControl.selectedSegmentIndex + 41
            if !userDataArray.isEmpty {
                userDataArray = [(name: String, size: Int)]()
                userDataArray.append((name: name, size: size))
            } else {
                userDataArray.append((name: name, size: size))
            }
        }
    }
    @objc func showBasketVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "basketVC") as? BasketViewController else { return }
        guard let name = userDataArray.first?.name else {return}
        guard let size = userDataArray.first?.size else {return}
        vc.nameSneakers = name
        vc.sizeSnikers = size
        print(size)
        self.present(vc, animated: true, completion: nil)
    }
}
