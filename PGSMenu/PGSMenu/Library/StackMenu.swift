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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(stackViewLeft)
        self.addArrangedSubview(stackViewRight)

        stacksConfiguration()

        let one = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        one.backgroundColor = UIColor.red
        let two = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        two.backgroundColor = UIColor.blue
        let three = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        three.backgroundColor = UIColor.green
        let four = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        four.backgroundColor = UIColor.orange

        stackViewLeft.addArrangedSubview(one)
        stackViewLeft.addArrangedSubview(two)

        stackViewRight.addArrangedSubview(three)
        stackViewRight.addArrangedSubview(four)
     }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func stacksConfiguration() {
        
        stackViewLeft.axis = .vertical
        stackViewLeft.alignment = .fill
        stackViewLeft.distribution = .fillEqually
        stackViewLeft.spacing = 0
        stackViewLeft.contentMode = .scaleToFill
        stackViewLeft.autoresizesSubviews = true


        stackViewRight.axis = .vertical
        stackViewRight.alignment = .fill
        stackViewRight.distribution = .fill
        stackViewRight.spacing = 0
        stackViewRight.contentMode = .scaleToFill
        //stackViewRight.autoresizesSubviews = true


        self.axis = .horizontal
        self.alignment = .top
        self.distribution = .fillEqually
        self.spacing = 0
        self.contentMode = .scaleToFill
        //self.autoresizesSubviews = true
        //self.clearsContextBeforeDrawing = true

        
    }
    
}
