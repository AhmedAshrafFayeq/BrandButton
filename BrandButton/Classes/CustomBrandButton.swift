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
    
    public var type: `Type` = .primary {
        didSet {
            configure()
        }
    }
    
    public var colorStyle: ColorStyle = .green {
        didSet {
            configure()
        }
    }
    
    private var iconStyle: IconStyle = .none {
        didSet {
            configureIconStyle()
        }
    }
    
    public var font: UIFont? {
        didSet {
            titleLabel.font = font
        }
    }
    
    public var highlitedFont: UIFont?
    
    public var highlitedLeadingIcon: UIImage?
    
    public var highlitedTrailingIcon: UIImage?

    @IBInspectable public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var leadingIcon: UIImage? {
        didSet {
            iconStyle = .leading
            leadingIconContainer.isHidden  = false
            trailingIconContainer.isHidden = true
        }
    }

    public var trailingIcon: UIImage? {
        didSet {
            iconStyle = .trailing
            trailingIconContainer.isHidden = false
            leadingIconContainer.isHidden  = true
        }
    }
    
    // MARK: - UIView Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        loadNib()
        setupContainerView()
        configure()
    }
    
    private func loadNib() {
        let bundle = Bundle(for: Swift.type(of: self))
        bundle.loadNibNamed(String(describing: CustomBrandButton.self), owner: self, options: nil)
    }
    
    private func setupContainerView() {
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.isUserInteractionEnabled = false
    }
    
    // MARK: - UIView Configurations
    private func configure() {
        switch type {
        case .primary:
            switch colorStyle {
            case .green:
                configurePrimaryGreenStyle()
            case .blue:
                configurePrimaryBlueStyle()
            }
        case .secondary:
            switch colorStyle {
            case .green:
                configureSecondaryGreenStyle()
            case .blue:
                configureSecondaryBlueStyle()
            }
        }
        configureFont()
        configureIcon()
    }
    
    private func configureFont() {
        titleLabel.font = isHighlighted ? highlitedFont ?? font : font
    }
    
    private func configureIcon() {
        switch iconStyle {
        case .leading:
            leadingIconImageView.image = isHighlighted ? highlitedLeadingIcon ?? leadingIcon : leadingIcon
            
        case .trailing:
            trailingIconImageView.image = isHighlighted ? highlitedTrailingIcon ?? trailingIcon : trailingIcon
        case .none: break
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
        titleLabel.textColor = isEnabled ? isHighlighted ? .darkGreenColor() : .lightGreenColor() :  .primaryDisabled()
        containerView.backgroundColor = isHighlighted ? .secondaryGreenPressed() : .white
        setBorder(color: isEnabled ? isHighlighted ? .darkGreenColor() : .lightGreenColor() : .primaryDisabled())
    }
    
    private func configureSecondaryBlueStyle() {
        titleLabel.textColor = isEnabled ? isHighlighted ? .darkBlueColor() : .lightBlueColor() : .primaryDisabled()
        containerView.backgroundColor = isHighlighted ? .secondaryBluePressed() : .white
        setBorder(color: isEnabled ? isHighlighted ? .darkBlueColor() : .lightBlueColor() : .primaryDisabled())

    }
    
    private func setBorder(color: UIColor, width: CGFloat = 1.0) {
        containerView.layer.borderWidth = width
        containerView.layer.borderColor = color.cgColor
    }
    
    private func configureIconStyle() {
        switch iconStyle {
        case .none:
            setupNoneStyleForView()
        case .leading:
            setupLeadingStyleForView()
        case .trailing:
            setupTrailingStyleForView()
        }
    }
    
    private func setupNoneStyleForView() {
        leadingIconContainer.isHidden  = true
        trailingIconContainer.isHidden = true
    }
    
    private func setupLeadingStyleForView() {
        leadingIconContainer.isHidden = false
        // Move trailingIcon to leadingImageView if exists
        leadingIconImageView.image = leadingIcon
        highlitedLeadingIcon = leadingIcon
        trailingIconContainer.isHidden = true
    }
    
    private func setupTrailingStyleForView() {
        trailingIconContainer.isHidden = false
        // Move leadingIcon to trailingImageView if exists
        trailingIconImageView.image =  trailingIcon
        highlitedTrailingIcon = trailingIcon
        leadingIconContainer.isHidden = true
    }
}


extension CustomBrandButton {
    
    public enum `Type` {
        case primary
        case secondary
    }
    
    public enum ColorStyle {
        case green
        case blue
    }
    
    public enum IconStyle {
        case none
        case leading
        case trailing
    }
}
