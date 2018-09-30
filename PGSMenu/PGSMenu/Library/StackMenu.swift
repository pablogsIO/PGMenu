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

    private var panelStackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))

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

        panelStackView.axis = .vertical
        panelStackView.alignment = .center
        panelStackView.distribution = .equalSpacing
        panelStackView.spacing = 0
        panelStackView.contentMode = .scaleToFill

        self.addArrangedSubview(panelStackView)
        // TODO: Typealias for ButtonConfiguration<CircleButtonParameters, Any>
        let panelItems = stride(from: 0, to: configuration.count, by: 2).map { (index) -> (ButtonConfiguration<CircleButtonParameters, Any>, ButtonConfiguration<CircleButtonParameters, Any>?) in
            (configuration[index], index<configuration.count-1 ? configuration[index+1] : nil )
        }
        var buttonTag = 0
        for element in panelItems {
            setConstraints(menuItems: element, buttonTag: buttonTag)
            buttonTag += 2
        }
    }

    private func setConstraints(menuItems: (ButtonConfiguration<CircleButtonParameters, Any>, ButtonConfiguration<CircleButtonParameters, Any>?), buttonTag: Int) {
        let menuViewWidth = panelStackView.frame.width

        let container = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.25*self.frame.width))
        let leadingTrailing = (container.frame.size.height)/4
        //Menu Items
        let first = MenuView(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: menuItems.0, index: buttonTag)

        if let menuItem = menuItems.1 {
            let second = MenuView(frame: CGRect(x: 0, y: 0, width: menuViewWidth, height: menuViewWidth), parameters: menuItem, index: (buttonTag+1))
            setConstraint(container: container, menu: first, leading: leadingTrailing, trailing: nil)
            setConstraint(container: container, menu: second, leading: nil, trailing: leadingTrailing)
        } else {
            setConstraint(container: container, menu: first, leading: nil, trailing: nil)
        }
        panelStackView.addArrangedSubview(container)
        panelStackView.spacing = leadingTrailing
        NSLayoutConstraint.init(item: container, attribute: .width, relatedBy: .equal, toItem: panelStackView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: container, attribute: .height, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 0.40, constant: 0).isActive = true
    }

    private func setConstraint(container: UIView, menu: MenuView, leading: CGFloat?, trailing: CGFloat?) {

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
        delegate?.stackMenu?(pressedButtonAtIndex: sender.tag)
    }

}
@objc protocol AwesomeProtocol {
    func awesomeMethod()
}
