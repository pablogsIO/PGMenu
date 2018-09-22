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

        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))
        self.gradientOrientation = gradientOrientation
        self.gradientColor = color
        
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
        //self.backgroundColor = self.gradientColor.withAlphaComponent(0.2)
        //self.backgroundColor = UIColor(displayP3Red: 56/255.0, green: 239/255.0, blue: 125/255.0, alpha: 0.5)
        //self.backgroundColor = UIColor.white
        setGradienteBackground(color: self.gradientColor, gradientOrientation: self.gradientOrientation)
        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        
        let icon = UIImage(named: "airquality")
        self.setImage(icon, for: .normal)
        

    }
}

extension UIView {

    func setGradienteBackground(color: UIColor, gradientOrientation: GradientOrientation) {
        let gradient = CAGradientLayer()
        //gradient.colors = [color.cgColor, color.withAlphaComponent(0.2).cgColor]
        gradient.colors = [UIColor(rgb: 0x11998e).cgColor, UIColor(rgb: 0x38ef7d).cgColor]
        gradient.startPoint = gradientOrientation.points().startPoint
        gradient.endPoint = gradientOrientation.points().endPoint
        gradient.frame = bounds

        self.layer.insertSublayer(gradient, at: 0)
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
