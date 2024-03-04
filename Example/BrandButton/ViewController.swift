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
    
    // MARK: - Properties
    
    var typeSegmentedControl: UISegmentedControl!
    var colorStyleSegmentedControl: UISegmentedControl!
    var iconStyleSegmentedControl: UISegmentedControl!
    var isEnabledSwitch: UISwitch!
    let brandButton = CustomBrandButton()
    
    let image = UIImage(named: "swift")
    let highlightedImage = UIImage(named: "swift-2")
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureButton()
    }
    
    // MARK: - UI Configuration
    
    private func configureUI() {
        typeSegmentedControl = createSegmentedControl(withOptions: ["Primary", "Secondary"])
        typeSegmentedControl.center = CGPoint(x: view.center.x, y: view.center.y - 230)
        view.addSubview(typeSegmentedControl)
        
        colorStyleSegmentedControl = createSegmentedControl(withOptions: ["Green", "Blue"])
        colorStyleSegmentedControl.center = CGPoint(x: view.center.x, y: view.center.y - 180)
        view.addSubview(colorStyleSegmentedControl)
        
        iconStyleSegmentedControl = createSegmentedControl(withOptions: ["None", "Leading", "Trailing"])
        iconStyleSegmentedControl.center = CGPoint(x: view.center.x, y: view.center.y - 130)
        view.addSubview(iconStyleSegmentedControl)
        
        isEnabledSwitch = UISwitch()
        isEnabledSwitch.center = CGPoint(x: view.center.x, y: view.center.y - 80)
        isEnabledSwitch.isOn = true
        isEnabledSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(isEnabledSwitch)
    }
    
    private func configureButton() {
        brandButton.frame = CGRect(x: 0, y: 0, width: 220, height: 45)
        brandButton.center = view.center
        view.addSubview(brandButton)
        brandButton.addTarget(self, action: #selector(didTapBrandButton), for: .touchUpInside)
        
        // Set default configuration
        brandButton.highlitedFont = UIFont(name: "Helvetica-Bold", size: 20)
        brandButton.isEnabled = true
        brandButton.type = .primary
        brandButton.colorStyle = .green
    }
    
    private func createSegmentedControl(withOptions options: [String]) -> UISegmentedControl {
        let segmentedControl = UISegmentedControl(items: options)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedControl
    }
    
    // MARK: - Actions
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        brandButton.isEnabled = sender.isOn
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender {
        case typeSegmentedControl:
            brandButton.type = (sender.selectedSegmentIndex == 0) ? .primary : .secondary
        case colorStyleSegmentedControl:
            brandButton.colorStyle = (sender.selectedSegmentIndex == 0) ? .green : .blue
        case iconStyleSegmentedControl:
            switch sender.selectedSegmentIndex {
            case 0:
                brandButton.leadingIcon = nil
                brandButton.trailingIcon = nil
            case 1:
                brandButton.leadingIcon = image
                brandButton.highlitedLeadingIcon = highlightedImage
            case 2:
                brandButton.trailingIcon = image
                brandButton.highlitedTrailingIcon = highlightedImage
            default:
                break
            }
        default:
            break
        }
    }
    
    @objc private func didTapBrandButton() {
        print("Brand button tapped")
    }
}
