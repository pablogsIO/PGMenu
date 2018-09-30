//
//  StackMenu.swift
//  PGSMenu
//
//  Created by Pablo on 23/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

@objc protocol StackMenuDelegate {

    @objc optional func stackMenu( pressedButtonAtIndex: Int)
}

class StackMenu: UIStackView {

    public weak var delegate: StackMenuDelegate?

    private var stackViewLeft = UIStackView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    private var stackViewRight = UIStackView(frame: CGRect(x: 25, y: 0, width: 25, height: 25))

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
        self.distribution = .equalSpacing
        self.spacing = 0
        self.contentMode = .scaleToFill

        stackViewLeft.axis = .vertical
        stackViewLeft.alignment = .center
        stackViewLeft.distribution = .equalSpacing
        stackViewLeft.spacing = 0
        stackViewLeft.contentMode = .scaleToFill

        stackViewRight.axis = .vertical
        stackViewRight.alignment = .center
        stackViewRight.distribution = .equalSpacing
        stackViewRight.spacing = 10
        //stackViewRight.contentMode = .scaleToFill

        self.addArrangedSubview(stackViewLeft)
//        self.addArrangedSubview(stackViewRight)

        var index = 0
        let menuViewWidth = stackViewLeft.frame.width
        var container: UIView?
        var leadingTrailing: CGFloat?
        for element in configuration {
            
            let menu = MenuView(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: element, index: index)
            //menu.translatesAutoresizingMaskIntoConstraints = true
            if index % 2 == 0 {
                container = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.25*self.frame.width))

                leadingTrailing = (container?.frame.size.height)!/4
                stackViewLeft.spacing = leadingTrailing!
                setConstraint(container: container!, menu: menu, index: index, leading: leadingTrailing, trailing: nil)
            } else {
                setConstraint(container: container!, menu: menu, index: index, leading: nil, trailing: leadingTrailing)
            }
            index += 1
        }
    }

    private func setConstraint(container: UIView, menu: MenuView, index: Int, leading: CGFloat?, trailing: CGFloat?) {

        let colors = [UIColor.red, UIColor.blue, UIColor.orange, UIColor.green, UIColor.purple]
        //container.backgroundColor = colors[index]
        container.addSubview(menu)

        NSLayoutConstraint.init(item: menu, attribute: .centerY, relatedBy: .equal, toItem: container, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menu, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menu, attribute: .width, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0).isActive = true
        if let leading = leading {
            NSLayoutConstraint.init(item: menu, attribute: .leading , relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: leading).isActive = true
        } else {
            NSLayoutConstraint.init(item: menu, attribute: .trailing , relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: -trailing!).isActive = true
        }
        stackViewLeft.addArrangedSubview(container)

        NSLayoutConstraint.init(item: container, attribute: .width, relatedBy: .equal, toItem: stackViewLeft, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: container, attribute: .height, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 0.40, constant: 0).isActive = true

    }

    @objc
    func buttonTapped(sender: UIButton) {
        delegate?.stackMenu?(pressedButtonAtIndex: sender.tag)
    }

}
@objc protocol AwesomeProtocol {
    func awesomeMethod()
}
