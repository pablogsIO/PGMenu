//
//  ViewController.swift
//  PGSMenu
//
//  Created by Pablo on 21/09/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.gradienteBackground(colors: (initColor: UIColor(rgb: 0x6A82FB), endColor: UIColor(rgb: 0xFC5C7D)), orientation: .bottomRightTopLeft)

        let menuItems = self.getButtonsParameters()
        let stackMenu = StackMenu(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), configuration: menuItems)
        stackMenu.delegate = self
        self.view.addSubview(stackMenu)
        stackMenu.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                stackMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                stackMenu.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                stackMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                stackMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
                ])
        } else {
            NSLayoutConstraint(item: stackMenu, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: stackMenu, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: stackMenu, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
            NSLayoutConstraint(item: stackMenu, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        }
    }

    private func getButtonsParameters() -> [ButtonConfiguration<CircleButtonParameters, Any>] {

        var parameters = [ButtonConfiguration<CircleButtonParameters, Any>]()

        let airquality = getMenuItemConfiguration(imageName: "airquality",
                                                  gradient: Gradient(colors: (initColor: UIColor(rgb: 0x11998e), endColor: UIColor(rgb: 0x38ef7d)),
                                                                     orientation: GradientOrientation.bottomRightTopLeft),
                                                  textMenuItem: "Air quality")
        let journey = getMenuItemConfiguration(imageName: "journey",
                                               gradient: Gradient(colors: (initColor: UIColor(rgb: 0x800080), endColor: UIColor(rgb: 0xffc0cb)), orientation: GradientOrientation.bottomRightTopLeft),
                                               textMenuItem: "Journey")
        let lineStatus = getMenuItemConfiguration(imageName: "linestatus",
                                               gradient: Gradient(colors: (initColor: UIColor(rgb: 0xfc4a1a), endColor: UIColor(rgb: 0xf7b733)), orientation: GradientOrientation.bottomRightTopLeft),
                                               textMenuItem: "Lines Status")

        let tubeLines = getMenuItemConfiguration(imageName: "tubelines",
                                                 gradient: Gradient(colors: (initColor: UIColor(rgb: 0x1c92d2), endColor: UIColor(rgb: 0xf2fcfe)), orientation: GradientOrientation.bottomRightTopLeft),
                                                 textMenuItem: "Tube Lines")
        let bike = getMenuItemConfiguration(imageName: "bike",
                                                  gradient: Gradient(colors: (initColor: UIColor(rgb: 0x2c3e50), endColor: UIColor(rgb: 0x4CA1AF)),
                                                                     orientation: GradientOrientation.bottomRightTopLeft),
                                                  textMenuItem: "Bikes")
        let bus = getMenuItemConfiguration(imageName: "bus",
                                                  gradient: Gradient(colors: (initColor: UIColor(rgb: 0x834d9b), endColor: UIColor(rgb: 0xd04ed6)),
                                                                     orientation: GradientOrientation.bottomRightTopLeft),
                                                  textMenuItem: "Bus Stops")

        parameters = [airquality, journey, lineStatus, tubeLines, bike, bus]
        return parameters
    }

    private func getMenuItemConfiguration(imageName: String, gradient: Gradient, textMenuItem: String) -> buttonConfiguration {

        let menuItemConfiguration = ButtonConfiguration<CircleButtonParameters, Any>(resolver: { (type) -> Any in
            switch type {
            case .imageName:
                return imageName
            case .gradient:
                return gradient
            case .textMenuItem:
                return textMenuItem
            }
        })
        return menuItemConfiguration
    }

}

extension ViewController: StackMenuDelegate {

    @objc func stackMenu( pressedButtonAtIndex: Int) {
        print("Pressed: \(#function) index: \(pressedButtonAtIndex)")
    }
}

extension UIView {

    func gradienteBackground(colors: GradientColors, orientation: GradientOrientation) {
        let gradient = CAGradientLayer()

        gradient.colors = [colors.initColor.cgColor, colors.endColor.cgColor]
        gradient.startPoint = orientation.points().startPoint
        gradient.endPoint = orientation.points().endPoint
        gradient.frame = bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
