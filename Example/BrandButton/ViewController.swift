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
    @IBOutlet weak var blueBrandButton: CustomBrandButton!
    @IBOutlet weak var secondaryGreenButton: CustomBrandButton!
    @IBOutlet weak var secondaryBlueButton: CustomBrandButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        brandButton.addTarget(self, action: #selector(didTapBrandButton), for: .touchUpInside)
        brandButton.leadingIcon = UIImage(named: "swift")
        brandButton.font = UIFont(name: "Helvetica-Regular", size: 15)
        brandButton.highlitedFont = UIFont(name: "Helvetica-Bold", size: 18)
        brandButton.highlitedLeadingIcon = UIImage(named: "swift-2")
        
        blueBrandButton.title = "Primary Blue"
        blueBrandButton.colorStyle = .blue
//        blueBrandButton.trailingIcon = UIImage(named: "swift")
        
        secondaryGreenButton.title = "Secondary"
        secondaryGreenButton.type = .secondary
        secondaryGreenButton.leadingIcon = UIImage(named: "swift-2")
        secondaryGreenButton.addTarget(self, action: #selector(didTapsecondaryGreenButton), for: .touchUpInside)
        
        secondaryBlueButton.title = "Secondary Blue"
        secondaryBlueButton.type = .secondary
        secondaryBlueButton.colorStyle = .blue
        secondaryBlueButton.isEnabled = false
        secondaryBlueButton.leadingIcon = UIImage(named: "swift-2")
        
    }
    
    @objc func didTapBrandButton() {
        print("did Tap Brand button")
        blueBrandButton.leadingIcon = UIImage(named: "swift-2")
    }
    
    @objc func didTapsecondaryGreenButton() {
        print("did Tap Brand button")
        blueBrandButton.trailingIcon = UIImage(named: "swift")
        blueBrandButton.highlitedTrailingIcon = UIImage(named: "swift-2")

        secondaryBlueButton.isEnabled = true

    }
}
