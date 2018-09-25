//
//  MenuView.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class MenuView: UIView {

    private var gradientOrientation = GradientOrientation.bottomRightTopLeft
    private var gradientColor = UIColor.black

    init(frame: CGRect, parameters: ButtonConfiguration<CircleButtonParameters, Any>) {
        let maximun = max(frame.width, frame.height)

        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))

        commonInit(parameters: parameters)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func commonInit(parameters: ButtonConfiguration<CircleButtonParameters, Any>) {

        self.backgroundColor = UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 0.5).withAlphaComponent(0.2)
        self.layer.cornerRadius = 0.15 * self.bounds.width

        let button = CircleButton(frame: CGRect(x: self.frame.width/2 , y: self.frame.height/2, width: self.frame.size.width/2, height: self.frame.size.width/2), gradientColors: parameters[.gradientcolors] as! GradientColors, gradientOrientation:  parameters[.orientation] as! GradientOrientation)
        button.layer.masksToBounds  = true

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/5))

        label.font = UIFont.systemFont(ofSize: 10)
        label.text = parameters[.text] as! String
        label.textAlignment = .center
        label.textColor = UIColor(rgb: 0xFFFFFF)

        self.addSubview(button)
        self.addSubview(label)
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        self.setConstraints(button: button, label: label)

    }

    private func setConstraints(button: UIButton, label: UILabel) {

        let centerHorizontally = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0)

        let centerVertically = NSLayoutConstraint(item: button,
                                                  attribute: .centerY,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .centerY,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        let labelBottomConstraint = NSLayoutConstraint(item: label,
                                                       attribute: .bottom,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .bottomMargin,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
        
        NSLayoutConstraint(item: button,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: button.frame.width).isActive = true

        NSLayoutConstraint(item: button,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: button.frame.height).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: self.frame.width).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: self.frame.height/8).isActive = true

        NSLayoutConstraint.activate([centerHorizontally, centerVertically, labelBottomConstraint])
    }
}
