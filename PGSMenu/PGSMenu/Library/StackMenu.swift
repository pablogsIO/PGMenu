//
//  StackMenu.swift
//  PGSMenu
//
//  Created by Pablo on 23/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class StackMenu: UIStackView {

    private var stackViewLeft = UIStackView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private var stackViewRight = UIStackView(frame: CGRect(x: 25, y: 0, width: 100, height: 100))

    init(frame: CGRect, configuration: [ButtonConfiguration<CircleButtonParameters, Any>]) {
        super.init(frame: frame)
        stacksConfiguration(configuration: configuration)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stacksConfiguration(configuration: [ButtonConfiguration<CircleButtonParameters, Any>]) {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 0
        self.contentMode = .scaleToFill

        stackViewLeft.axis = .vertical
        stackViewLeft.alignment = .center
        stackViewLeft.distribution = .equalSpacing
        stackViewLeft.spacing = 10
        stackViewLeft.contentMode = .scaleToFill

        stackViewRight.axis = .vertical
        stackViewRight.alignment = .center
        stackViewRight.distribution = .equalSpacing
        stackViewRight.spacing = 10
        stackViewRight.contentMode = .scaleToFill

        self.addArrangedSubview(stackViewLeft)
        self.addArrangedSubview(stackViewRight)
        var index = 0
        let menuViewWidth = stackViewLeft.frame.width
        for element in configuration {

            let menu = MenuView(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: element, index: index)
            //menu.translatesAutoresizingMaskIntoConstraints = true
            if index % 2 == 0 {
                stackViewLeft.addArrangedSubview(menu)

                NSLayoutConstraint.init(item: menu, attribute: .width, relatedBy: .equal, toItem: stackViewLeft, attribute: .width, multiplier: 0.75, constant: 0).isActive = true
                NSLayoutConstraint.init(item: menu, attribute: .height, relatedBy: .equal, toItem: stackViewLeft, attribute: .width, multiplier: 0.75, constant: 0).isActive = true
            } else {
                stackViewRight.addArrangedSubview(menu)

                NSLayoutConstraint.init(item: menu, attribute: .width, relatedBy: .equal, toItem: stackViewRight, attribute: .width, multiplier: 0.75, constant: 0).isActive = true
                NSLayoutConstraint.init(item: menu, attribute: .height, relatedBy: .equal, toItem: stackViewRight, attribute: .width, multiplier: 0.75, constant: 0).isActive = true
            }
            index += 1
        }
    }
    @objc
    func buttonTapped(sender: UIButton) {
        print("pablogsio: \(sender.tag) \(#function)")
    }

}
@objc protocol AwesomeProtocol {
    func awesomeMethod()
}
