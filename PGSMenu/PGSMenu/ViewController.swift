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
        
        let view = MenuView(frame: CGRect(x: 100, y: 100, width: 500, height: 600), color: UIColor(displayP3Red: 45/255.0, green: 43/255.0, blue: 88/255.0, alpha: 0.5), gradientOrientation: .bottomLeftTopRight)
        //self.view.addSubview(view)
        
        let stackMenu = StackMenu(frame: view.frame)
        
        self.view.addSubview(stackMenu)
        stackMenu.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackMenu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackMenu.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackMenu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackMenu.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
            
            ])
    }
    
    
}
