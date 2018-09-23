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

    init(frame: CGRect, color: UIColor, gradientOrientation: GradientOrientation) {
        let maximun = max(frame.width, frame.height)
        self.gradientOrientation = gradientOrientation
        self.gradientColor = color
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))

        commonInit()
    }

    override convenience init(frame: CGRect) {
        self.init(frame: frame, color: UIColor.green, gradientOrientation: .bottomRightTopLeft)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        commonInit()
    }

    private func commonInit() {

        self.backgroundColor = self.gradientColor.withAlphaComponent(0.5)
        self.layer.cornerRadius = 0.15 * self.bounds.width
        let button = CircleButton(frame: CGRect(x: self.frame.width/2 , y: self.frame.height/2, width: 100, height: 100), color: UIColor(displayP3Red: 7/255.0, green: 126/255.0, blue: 12/255.0, alpha: 1), gradientOrientation: .bottomRightTopLeft)
        
        button.layer.masksToBounds  = true

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/8))
        label.text = "Testing"
        label.textAlignment = .center
        label.textColor = UIColor(rgb: 0x11998e)

        self.addSubview(button)
        self.addSubview(label)
        button.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        let centerHorizontally = NSLayoutConstraint(item: button,
                                                    attribute: .centerX,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .centerX,
                                                    multiplier: 1.0,
                                                    constant: 0.0)

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

       NSLayoutConstraint.activate([centerHorizontally, centerVertically, labelBottomConstraint])

    }

}
