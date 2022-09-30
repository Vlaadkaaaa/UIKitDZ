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
        backSwitch.addTarget(self, action: #selector(reverseBacgroundColorAction), for: .valueChanged)
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
    var buyButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 570, width: 330, height: 40))
        button.backgroundColor = .systemRed
        button.setTitle("Купить", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let sneakers = [UIImage(named: "walker"),
                         UIImage(named: "trainer"),
                         UIImage(named: "runner")]
    var userData = [(name: String, size: Int)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewElementsAndAction()
    }

    @objc func reverseBacgroundColorAction(target: UISwitch) {
        if target.isOn {
            view.backgroundColor = .black
            textLabel.textColor = .white
            nameSegmentedControl.backgroundColor = .white
            sizeSegmentedControl.backgroundColor = .white
        } else {
            view.backgroundColor = .white
            textLabel.textColor = .black
        }
    }
    @objc func changeImageSneakersAction(target: UISegmentedControl) {
        if target == self.nameSegmentedControl {
            let segmentedIndex = target.selectedSegmentIndex
            imageView.image = self.sneakers[segmentedIndex]
            guard let name = target.titleForSegment(at: segmentedIndex) else { return }
            let size = sizeSegmentedControl.selectedSegmentIndex + 41
            if !userData.isEmpty {
                userData = [(name: String, size: Int)]()
                userData.append((name: name, size: size))
            } else {
                userData.append((name: name, size: size))
            }
        }
    }
    @objc func showBasketVCAction() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(
            withIdentifier: "basketVC") as? BasketViewController else { return }
        guard let name = userData.first?.name else {return}
        guard let size = userData.first?.size else {return}
        vc.nameSneakers = name
        vc.sizeSnikers = size
        self.present(vc, animated: true, completion: nil)
    }
    private func showViewElementsAndAction() {
        view.addSubview(logoLabel)
        view.addSubview(textLabel)
        view.addSubview(backgroundSwitch)
        view.addSubview(borderView)
        view.addSubview(imageView)
        view.addSubview(nameSegmentedControl)
        view.addSubview(sizeSegmentedControl)
        view.addSubview(buyButton)
        
        nameSegmentedControl.addTarget(self, action: #selector(changeImageSneakersAction), for: .valueChanged)
        buyButton.addTarget(self, action: #selector(showBasketVCAction), for: .allTouchEvents)
    }
}
