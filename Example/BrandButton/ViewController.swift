//
//  ViewController.swift
//  BrandButton
//
//  Created by ahmedashraffayeq on 02/29/2024.
//  Copyright (c) 2024 ahmedashraffayeq. All rights reserved.
//

import UIKit
import BrandButton

class ViewController: UIViewController {
    @IBOutlet weak var brandButton: CustomBrandButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        brandButton.configure(title: "Primary Default", type: .primaryBlue)
        brandButton.fontSize = 16
        if #available(iOS 13.0, *) {
            let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 55, weight: .black)
            
            brandButton.trailingIcon = UIImage(systemName: "house", withConfiguration: homeSymbolConfiguration)
            brandButton.leadingIcon = UIImage(systemName: "house", withConfiguration: homeSymbolConfiguration)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

