//
//  CustomBrandButton.swift
//  CustomBrandButton
//
//  Created by Ahmed Fayek on 29/02/2024.
//

import UIKit

@IBDesignable public class CustomBrandButton: UIControl {
    
    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var leadingIconContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leadingIconImageView: UIImageView!
    @IBOutlet weak var trailingIconContainer: UIView!
    @IBOutlet weak var trailingIconImageView: UIImageView!
    
    // MARK: - Variables
    
    public override var isHighlighted: Bool {
        didSet {
            configure()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            configure()
        }
    }

    public var leadingIcon: UIImage? {
        didSet {
            leadingIconContainer.isHidden = false
            leadingIconImageView.image = leadingIcon
            trailingIconContainer.isHidden = true
        }
    }

    public var trailingIcon: UIImage? {
        didSet {
            trailingIconContainer.isHidden = false
            trailingIconImageView.image = trailingIcon
            leadingIconContainer.isHidden = true
        }
    }
    
    public var buttonType: ButtonType = .primary {
        didSet {
            configure()
        }
    }
    
    public var buttonColor: ButtonColor = .green {
        didSet {
            configure()
        }
    }
    
    public var buttonIconStyle: ButtonIconStyle = .none {
        didSet {
            configureIconStyle()
        }
    }
    
    public var font: UIFont? {
        didSet {
            titleLabel.font = font
        }
    }
    
    // MARK: UIView Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle(for: self.classForCoder)
        let nib = UINib(nibName: "CustomBrandButton", bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.isUserInteractionEnabled = false
    }
    
    public func configure(title: String, type: ButtonType) {
        titleLabel.text = title
        buttonType = type
        configure()
    }
    
    
    private func configure() {
        switch buttonType {
        case .primary:
            switch buttonColor {
            case .green:
                configurePrimaryGreenStyle()
            case .blue:
                configurePrimaryBlueStyle()
            }
        case .secondary:
            switch buttonColor {
            case .green:
                configureSecondaryGreenStyle()
            case .blue:
                configureSecondaryBlueStyle()
            }
        }
    }

    
    private func configurePrimaryGreenStyle() {
        titleLabel.textColor = .white
        containerView.backgroundColor = isEnabled ? isHighlighted ? .darkGreenColor() : .lightGreenColor() : .primaryDisabled()
    }
    
    private func configurePrimaryBlueStyle() {
        titleLabel.textColor = .white
        containerView.backgroundColor = isEnabled ? isHighlighted ?  .darkBlueColor() : .lightBlueColor() : .primaryDisabled()
    }
    
    private func configureSecondaryGreenStyle() {
        titleLabel.textColor = isEnabled ? isHighlighted ? .lightGreenColor() : .darkGreenColor() : .primaryDisabled()
        containerView.backgroundColor = isHighlighted ? .secondaryGreenPressed() : .white
        setBorder(color: isEnabled ? isHighlighted ? .darkGreenColor() : .lightGreenColor() : .primaryDisabled())
    }
    
    private func configureSecondaryBlueStyle() {
        titleLabel.textColor = isEnabled ? isHighlighted ? .darkBlueColor() : .lightBlueColor() : .primaryDisabled()
        containerView.backgroundColor = isHighlighted ? .secondaryBluePressed() : .white
        setBorder(color: isEnabled ? isHighlighted ? .darkBlueColor() : .lightBlueColor() : .primaryDisabled())

    }
    
    private func setBorder(color: UIColor) {
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = color.cgColor
    }
    
    private func configureIconStyle() {
        switch buttonIconStyle {
        case .none:
            leadingIconContainer.isHidden = true
            trailingIconContainer.isHidden = true
        case .leading:
            leadingIconContainer.isHidden = false
            leadingIconImageView.image = trailingIconImageView.image
            trailingIconContainer.isHidden = true
        case .trailing:
            trailingIconContainer.isHidden = false
            trailingIconImageView.image = leadingIconImageView.image
            leadingIconContainer.isHidden = true
        }
    }
}


extension CustomBrandButton {
    
    public enum ButtonType {
        case primary
        case secondary
    }
    
    public enum ButtonColor{
        case green
        case blue
    }

    
    public enum ButtonIconStyle {
        case none
        case leading
        case trailing
    }
}
