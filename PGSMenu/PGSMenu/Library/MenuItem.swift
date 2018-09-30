//
//  MenuView.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class MenuItem: UIView {

    private var gradientOrientation = GradientOrientation.bottomRightTopLeft
    private var gradientColor = UIColor.black

    private var button: CircleButton?
    private var label: UILabel?

    init(frame: CGRect, parameters: ButtonConfiguration<CircleButtonParameters, Any>, index: Int) {
        let maximun = max(frame.width, frame.height)

        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun*82.0/76.0)))
        self.translatesAutoresizingMaskIntoConstraints = false
        commonInit(parameters: parameters, index: index)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func commonInit(parameters: ButtonConfiguration<CircleButtonParameters, Any>, index: Int) {

        self.backgroundColor = UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 0.5).withAlphaComponent(0.2)
        self.layer.cornerRadius = 0.20 * self.bounds.width

        button = CircleButton(frame: CGRect(x: self.frame.size.width/2, y: self.frame.size.width/2, width: self.frame.size.width/2, height: self.frame.size.width/2), gradient: parameters[ .gradient] as! Gradient, imageName: parameters[.imageName] as! String)
        button?.tag = index
        button?.addTarget(nil, action: #selector(StackMenu.buttonTapped(sender:)), for: .touchUpInside)
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/5))

        label?.font = UIFont.systemFont(ofSize: 14)
        label?.text = parameters[.textMenuItem] as? String
        label?.textAlignment = .center
        label?.textColor = UIColor(rgb: 0xFFFFFF)

        self.addSubview(button!)
        self.addSubview(label!)
        button?.translatesAutoresizingMaskIntoConstraints = false
        label?.translatesAutoresizingMaskIntoConstraints = false

        self.setConstraints(button: button!, label: label!)

    }
    override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = 0.15 * self.bounds.width

    }
    private func setConstraints(button: UIButton, label: UILabel) {

        setButtonConstraints(button: button)
        setLabelConstraints(label: label)

    }

    private func setButtonConstraints(button: UIButton) {

        NSLayoutConstraint(item: button,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerX,
                           multiplier: 1.0,
                           constant: 0.0).isActive = true

        NSLayoutConstraint(item: button,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerY,
                           multiplier: 1.0,
                           constant: 0.0).isActive = false

        NSLayoutConstraint(item: button,
                           attribute: .top,
                           relatedBy: .equal ,
                           toItem: self,
                           attribute: .top,
                           multiplier: 1,
                           constant: 20).isActive = true

        NSLayoutConstraint(item: button,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .height ,
                           multiplier: 30/82,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: button,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: button,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }

    private func setLabelConstraints(label: UILabel) {

        NSLayoutConstraint(item: label,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .width,
                           multiplier: 1.0,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: label,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .centerX,
                           multiplier: 1.0,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: label,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .height,
                           multiplier: 1.0/8.0  ,
                           constant: self.frame.height/8).isActive = true

        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom ,
                           multiplier: 1.0,
                           constant: -20).isActive = true
    }
}
