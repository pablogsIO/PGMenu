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
        let button = CircleButton(frame: CGRect(x: self.bounds.width/2 , y: self.bounds.height/2, width: 100, height: 100), color: UIColor(displayP3Red: 7/255.0, green: 126/255.0, blue: 12/255.0, alpha: 1), gradientOrientation: .bottomRightTopLeft)
        let view = UIView(frame: self.frame)
        view.backgroundColor = UIColor.clear
        button.layer.masksToBounds  = true
        
        self.addSubview(view)
        self.addSubview(button)
    }

}
