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
        
        //let view = MenuView(frame: CGRect(x: 100, y: 100, width: 100, height: 100), color: UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 0.5), gradientOrientation: .bottomLeftTopRight)
        //self.view.addSubview(view)
        let buttonConfiguration = ButtonConfiguration<CircleButtonParameters,Any> { (type) -> Any in
            switch type {
            case .image:
                return "airquality"
            case .gradientcolors:
                return (initColor: UIColor(rgb: 0x11998e), endColor: UIColor(rgb: 0x38ef7d))
            case .orientation:
                return GradientOrientation.bottomRightTopLeft
            case .text:
                return "Tube stations"
            }
        }
        
        let menu = MenuView(frame: CGRect(x: 100, y: 100, width: 100, height: 100), parameters: buttonConfiguration)
        
        self.view.addSubview(menu)

//        let stackMenu = StackMenu(frame: self.view.frame, configuration: [buttonConfiguration])
//        let button = CircleButton(frame: CGRect(x: 100, y: 1000, width: 50, height: 50), gradientColors: buttonConfiguration[.gradientcolors] as! GradientColors, gradientOrientation:  buttonConfiguration[.orientation] as! GradientOrientation)
//        self.view.addSubview(button)
//        self.view.addSubview(stackMenu)
//        stackMenu.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            stackMenu.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//            stackMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//            stackMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
//            ])
    }
}
