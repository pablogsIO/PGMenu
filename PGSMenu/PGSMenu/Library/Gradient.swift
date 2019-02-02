//
//  Gradient.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)
typealias GradientColors = (initColor: UIColor, endColor: UIColor)

struct Gradient {
    var colors: GradientColors
    var orientation: GradientOrientation
}

enum GradientOrientation {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight

    func points() -> GradientPoints {
        switch self {
        case .leftRight:
            return (startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (startPoint: CGPoint(x: 1, y: 0.5), endPoint: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (startPoint: CGPoint(x: 0.5, y: 1), endPoint: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (startPoint: CGPoint(x: 1, y: 1), endPoint: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
        }
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
