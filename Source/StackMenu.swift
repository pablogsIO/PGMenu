//
//  StackMenu.swift
//  PGSMenu
//
//  Created by Pablo on 23/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

@objc public protocol StackMenuDelegate {

    @objc optional func stackMenu( pressedButtonAtIndex: Int)
}

open class StackMenu: UIStackView {

    public weak var delegate: StackMenuDelegate?

    private let relationFactor: CGFloat = 0.40*6/7.0

    private var panelStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))

    public init(frame: CGRect, configuration: [ButtonConfiguration<CircleButtonParameters, Any>]) {
        super.init(frame: frame)
        stackConfiguration()
        stackItemsConfiguration(configuration: configuration)
    }

    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stackConfiguration() {
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .equalSpacing
        self.spacing = 0
        self.contentMode = .scaleToFill

        panelStackView.axis = .vertical
        panelStackView.alignment = .center
        panelStackView.distribution = .equalSpacing
        panelStackView.spacing = 0
        panelStackView.contentMode = .scaleToFill

        self.addArrangedSubview(panelStackView)

    }

    private func stackItemsConfiguration(configuration: [buttonConfiguration]) {

        let stackItems = stride(from: 0, to: configuration.count, by: 2).map { (index) -> buttonConfigurationTuple in
            (configuration[index], index<configuration.count-1 ? configuration[index+1] : nil )
        }

        var buttonTag = 0
        for element in stackItems {
            setConstraints(menuItems: element, buttonTag: buttonTag)
            buttonTag += 2
        }
    }
    private func setConstraints(menuItems: buttonConfigurationTuple, buttonTag: Int) {
        let menuViewWidth = panelStackView.frame.width

        let container = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: relationFactor*self.frame.width))
        let leadingTrailing = (self.frame.width - 2*(relationFactor*self.frame.width))/3

        let firstItem = MenuItem(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: menuItems.0, index: buttonTag)

        if let menuItem = menuItems.1 {
            let secondItem = MenuItem(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: menuItem, index: (buttonTag+1))
            setConstraintMenuItem(container: container, menu: firstItem, leading: leadingTrailing, trailing: nil)
            setConstraintMenuItem(container: container, menu: secondItem, leading: nil, trailing: leadingTrailing)
        } else {
            setConstraintMenuItem(container: container, menu: firstItem, leading: nil, trailing: nil)
        }
        panelStackView.addArrangedSubview(container)
        panelStackView.spacing = leadingTrailing
        NSLayoutConstraint.init(item: container, attribute: .width, relatedBy: .equal, toItem: panelStackView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: container, attribute: .height, relatedBy: .equal, toItem: container, attribute: .width, multiplier: relationFactor, constant: 0).isActive = true
    }

    private func setConstraintMenuItem(container: UIView, menu: MenuItem, leading: CGFloat?, trailing: CGFloat?) {

        container.addSubview(menu)

        NSLayoutConstraint.init(item: menu, attribute: .centerY, relatedBy: .equal, toItem: container, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menu, attribute: .height, relatedBy: .equal, toItem: container, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: menu, attribute: .width, relatedBy: .equal, toItem: menu, attribute: .height, multiplier: 1, constant: 0).isActive = true
        if let leading = leading {
            NSLayoutConstraint.init(item: menu, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: leading).isActive = true
        } else if let trailing = trailing {
            NSLayoutConstraint.init(item: menu, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: -trailing).isActive = true
        } else {
            NSLayoutConstraint.init(item: menu, attribute: .centerX, relatedBy: .equal, toItem: container, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        }
    }

    @objc
    func buttonTapped(sender: UIButton) {

        sender.animate {
            self.delegate?.stackMenu?(pressedButtonAtIndex: sender.tag)
        }
    }

}
@objc protocol AwesomeProtocol {
    func awesomeMethod()
}
