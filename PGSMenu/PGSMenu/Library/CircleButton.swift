//
//  CircleButton.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

enum CircleButtonParameters: CaseIterable, Hashable {

    case imageName
    case gradient
    case textMenuItem
}
class CircleButton: UIButton {

    private var gradient = CAGradientLayer()

    init(frame: CGRect, gradient: Gradient, imageName: String) {
        let maximun = max(frame.width, frame.height)
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))
        self.translatesAutoresizingMaskIntoConstraints = false
        commonInit(gradientColors: gradient.colors, gradientOrientation: gradient.orientation, imageName: imageName)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit(gradientColors: GradientColors, gradientOrientation: GradientOrientation, imageName: String) {

        setGradienteBackground(colors: gradientColors, orientation: gradientOrientation)

        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.width

        self.setImage(UIImage(named: imageName), for: .normal)
        self.setImage(UIImage(named: imageName), for: .highlighted)

        let margin = self.bounds.size.width/4
        self.imageEdgeInsets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)

        self.bringSubviewToFront(self.imageView!)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.gradient.frame = self.bounds
        self.gradient.cornerRadius = 0.5 * self.bounds.size.width
        let margin = self.bounds.size.width/4
        self.imageEdgeInsets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }

    func setGradienteBackground(colors: GradientColors, orientation: GradientOrientation) {
        gradient = CAGradientLayer()

        gradient.colors = [colors.initColor.cgColor, colors.endColor.cgColor]
        gradient.startPoint = orientation.points().startPoint
        gradient.endPoint = orientation.points().endPoint
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
