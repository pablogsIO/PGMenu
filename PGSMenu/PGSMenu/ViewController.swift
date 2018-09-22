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
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = CircleButton(frame: CGRect(x: 100, y: 500, width: 100, height: 100), color: UIColor(displayP3Red: 7/255.0, green: 126/255.0, blue: 12/255.0, alpha: 1), gradientOrientation: .bottomRightTopLeft)
        self.view.addSubview(button)
        
        let icon = UIImageView(image: UIImage(named: "airquality"))
    
        self.view.addSubview(icon)
        print("pablogsio: \(button.buttonType)")
//
        let view = MenuView(frame: CGRect(x: 100, y: 100, width: 200, height: 200), color: UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 0.5), gradientOrientation: .bottomLeftTopRight)
        self.view.addSubview(view)

        
//        let mybutton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        mybutton.layer.masksToBounds = true
//        mybutton.backgroundColor = UIColor.white
//        view.setGradienteBackground(color: UIColor.white, gradientOrientation: .bottomRightTopLeft)
//
//        mybutton.setGradienteBackground(color: UIColor(displayP3Red: 7/255.0, green: 126/255.0, blue: 12/255.0, alpha: 1), gradientOrientation: .bottomRightTopLeft)
//        mybutton.layer.cornerRadius = 0.5 * mybutton.bounds.size.width
//        view.addSubview(mybutton)

        
//        let button = UIButton(frame: CGRect(x: 200, y: 500, width: 200, height: 200))
//        button.backgroundColor = UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 1)
//        //button.setGradienteBackground(color: UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 1), gradientOrientation: .bottomRightTopLeft)
//        button.clipsToBounds = true
//       // button.layer.cornerRadius = 30 * button.bounds.width
//
//        let roundView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        roundView.backgroundColor = UIColor.white
//        roundView.layer.cornerRadius = 0.5 * roundView.bounds.width
//        roundView.addSubview(UIImageView(image: UIImage(named: "airquality")))
//        button.addSubview(roundView)
//        self.view.addSubview(button)
        
    }

}

