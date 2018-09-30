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
        NSLayoutConstraint.activate([
                        stackMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                        stackMenu.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                        stackMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                        stackMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
                        ])
    }

    func getButtonsParameters() -> [ButtonConfiguration<CircleButtonParameters, Any>] {

        var parameters = [ButtonConfiguration<CircleButtonParameters, Any>]()

        let airquality = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .imageName:
                return "airquality"
            case .gradient:
                return Gradient(colors: (initColor: UIColor(rgb: 0x11998e), endColor: UIColor(rgb: 0x38ef7d)), orientation: GradientOrientation.bottomRightTopLeft)
            case .textMenuItem:
                return "Air quality"
            }
        }

        let secondItem = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .imageName:
                return "journey"
            case .gradient:
                return Gradient(colors: (initColor: UIColor(rgb: 0x800080), endColor: UIColor(rgb: 0xffc0cb)), orientation: GradientOrientation.bottomRightTopLeft)
            case .textMenuItem:
                return "Journey"
            }
        }

        let lineStatus = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .imageName:
                return "linestatus"
            case .gradient:
                return Gradient(colors: (initColor: UIColor(rgb: 0xfc4a1a), endColor: UIColor(rgb: 0xf7b733)), orientation: GradientOrientation.bottomRightTopLeft)
            case .textMenuItem:
                return "Lines Status"
            }
        }

        let tubeLines = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .imageName:
                return "tubelines"
            case .gradient:
                return Gradient(colors: (initColor: UIColor(rgb: 0x1c92d2), endColor: UIColor(rgb: 0xf2fcfe)), orientation: GradientOrientation.bottomRightTopLeft)
            case .textMenuItem:
                return "Tube Lines"
            }
        }

        parameters = [airquality, secondItem, lineStatus, tubeLines, airquality, secondItem, lineStatus]
        return parameters
    }

}

extension ViewController: StackMenuDelegate {

    @objc func stackMenu( pressedButtonAtIndex: Int) {
        print("pablogsio: \(#function) index: \(pressedButtonAtIndex)")
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
