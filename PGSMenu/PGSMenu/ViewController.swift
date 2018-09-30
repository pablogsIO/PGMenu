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

         let buttonConfiguration = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .image:
                return "airquality"
            case .gradientcolors:
                return (initColor: UIColor(rgb: 0x11998e), endColor: UIColor(rgb: 0x38ef7d))
            case .orientation:
                return GradientOrientation.bottomRightTopLeft
            case .text:
                return "Air quality"
            case .targetFunction:
                return #selector(self.buttonHandler(_:))
            }
        }

        let secondItem = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .image:
                return "journey"
            case .gradientcolors:
                return (initColor: UIColor(rgb: 0x800080), endColor: UIColor(rgb: 0xffc0cb))
            case .orientation:
                return GradientOrientation.bottomRightTopLeft
            case .text:
                return "Journey"
            case .targetFunction:
                return #selector(self.buttonHandler(_:))
            }
        }

        let lineStatus = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .image:
                return "linestatus"
            case .gradientcolors:
                return (initColor: UIColor(rgb: 0xfc4a1a), endColor: UIColor(rgb: 0xf7b733))
            case .orientation:
                return GradientOrientation.bottomRightTopLeft
            case .text:
                return "Lines Status"
            case .targetFunction:
                return #selector(self.buttonHandler(_:))
            }
        }

        let tubeLines = ButtonConfiguration<CircleButtonParameters, Any> { (type) -> Any in
            switch type {
            case .image:
                return "tubelines"
            case .gradientcolors:
                return (initColor: UIColor(rgb: 0x1c92d2), endColor: UIColor(rgb: 0xf2fcfe))
            case .orientation:
                return GradientOrientation.bottomRightTopLeft
            case .text:
                return "Tube Lines"
            case .targetFunction:
                return #selector(self.buttonHandler(_:))
            }
        }
        let stackMenu = StackMenu(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), configuration: [buttonConfiguration, secondItem, lineStatus, tubeLines, buttonConfiguration])
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

    @objc func buttonHandler(_ sender: CircleButton) {
        print("pablogsio: \(#function)")
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
