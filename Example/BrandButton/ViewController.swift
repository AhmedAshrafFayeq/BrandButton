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
        
        brandButton.configure(title: "Primary", type: .primary)
        brandButton.buttonColor = .green
        brandButton.addTarget(self, action: #selector(didTapBrandButton), for: .touchUpInside)
        brandButton.leadingIcon = UIImage(named: "swift")
        brandButton.font = UIFont(name: "Helvetica-Bold", size: 15)
        
        blueBrandButton.configure(title: "Primary Blue", type: .primary)
        blueBrandButton.buttonColor = .blue
        blueBrandButton.isEnabled = false
        blueBrandButton.trailingIcon = UIImage(named: "swift")
        
        secondaryGreenButton.configure(title: "Secondary", type: .secondary)
        secondaryGreenButton.buttonColor = .green
        secondaryGreenButton.leadingIcon = UIImage(named: "swift-2")
        secondaryGreenButton.addTarget(self, action: #selector(didTapsecondaryGreenButton), for: .touchUpInside)
        
        secondaryBlueButton.configure(title: "Secondary Blue", type: .secondary)
        secondaryBlueButton.buttonColor = .blue
        secondaryBlueButton.isEnabled = false
        secondaryBlueButton.leadingIcon = UIImage(named: "swift-2")
        
    }
    
    @objc func didTapBrandButton() {
        print("did Tap Brand button")
        blueBrandButton.isEnabled = true
        brandButton.buttonIconStyle = .leading

    }
    
    @objc func didTapsecondaryGreenButton() {
        print("did Tap Brand button")
        brandButton.buttonIconStyle = .trailing
        secondaryBlueButton.isEnabled = true

    }
}
