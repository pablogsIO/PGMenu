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
        self.alignment = .top
        self.distribution = .fillEqually
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
        stackViewRight.spacing = 0
        stackViewRight.contentMode = .scaleToFill
        
        self.addArrangedSubview(stackViewLeft)
        self.addArrangedSubview(stackViewRight)
        
        for element in configuration {
            
            let button = CircleButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), gradientColors: element[.gradientcolors] as! GradientColors, gradientOrientation:  element[.orientation] as! GradientOrientation)
            stackViewLeft.addArrangedSubview(button)
            
            NSLayoutConstraint.init(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: stackViewLeft.frame.size.width).isActive = true
            NSLayoutConstraint.init(item: button, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: stackViewLeft.frame.size.width).isActive = true
        }
        
        
        
        
//        let one = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        one.backgroundColor = UIColor.red
//        let two = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        two.backgroundColor = UIColor.blue
//        let three = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        three.backgroundColor = UIColor.green
//        let four = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        four.backgroundColor = UIColor.orange
//
//
//        stackViewLeft.addArrangedSubview(three)
//        stackViewLeft.addArrangedSubview(four)
//
//        stackViewRight.addArrangedSubview(one)
//
//        NSLayoutConstraint.init(item: one, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 75).isActive = true
//        NSLayoutConstraint.init(item: one, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 75).isActive = true
//
//        NSLayoutConstraint.init(item: three, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 75).isActive = true
//        NSLayoutConstraint.init(item: three, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 75).isActive = true
//
//        NSLayoutConstraint.init(item: four, attribute: .width, relatedBy: .equal, toItem: three, attribute: .width, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: four, attribute: .height , relatedBy: .equal, toItem: three, attribute: .height, multiplier: 1, constant: 0).isActive = true
//

    }
    
}
