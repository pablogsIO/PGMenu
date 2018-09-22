//
//  CircleButton.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

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
        self.backgroundColor = UIColor.white
        setGradienteBackground(color: self.gradientColor, gradientOrientation: self.gradientOrientation)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
/*
        let gradient = CAGradientLayer()
        gradient.colors = [self.gradientColor.cgColor, self.gradientColor.withAlphaComponent(0.5).cgColor]
        gradient.startPoint = self.gradientOrientation.points().startPoint
        gradient.endPoint = self.gradientOrientation.points().endPoint
        gradient.frame = self.bounds
        gradient.cornerRadius = 0.5 * self.bounds.size.width
        //self.layer.addSublayer(gradient)
        self.layer.insertSublayer(gradient, at: 0)
*/
    }
}

extension UIView {

    func setGradienteBackground(color: UIColor, gradientOrientation: GradientOrientation) {
        let gradient = CAGradientLayer()
        gradient.colors = [color.cgColor, color.withAlphaComponent(0.2).cgColor]
        gradient.startPoint = gradientOrientation.points().startPoint
        gradient.endPoint = gradientOrientation.points().endPoint
        gradient.frame = bounds

        self.layer.insertSublayer(gradient, at: 0)
    }

}
