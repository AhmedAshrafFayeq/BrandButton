//
//  CustomBrandButton.swift
//  CustomBrandButton
//
//  Created by Ahmed Fayek on 29/02/2024.
//

import UIKit

/**
 A customizable UIButton subclass with support for primary and secondary styles, different color schemes, and optional leading and trailing icons.
 */
@IBDesignable public class CustomBrandButton: UIControl {
    
    // MARK: - IBOutlets
    
    /// The container view holding the button's content.
    @IBOutlet var containerView: UIView!
    
    /// The container for the leading icon, if present.
    @IBOutlet weak var leadingIconContainer: UIView!
    
    /// The label displaying the button's title.
    @IBOutlet weak var titleLabel: UILabel!
    
    /// The image view displaying the leading icon.
    @IBOutlet weak var leadingIconImageView: UIImageView!
    
    /// The container for the trailing icon, if present.
    @IBOutlet weak var trailingIconContainer: UIView!
    
    /// The image view displaying the trailing icon.
    @IBOutlet weak var trailingIconImageView: UIImageView!
    
    
    // MARK: - Variables
    
    /// Overrides the default isHighlighted property to trigger UI updates.
    public override var isHighlighted: Bool {
        didSet {
            configure()
        }
    }
    
    /// Overrides the default isEnabled property to trigger UI updates.
    public override var isEnabled: Bool {
        didSet {
            configure()
        }
    }

    /// The type of the button, either primary or secondary.
    public var type: `Type` = .primary {
        didSet {
            configure()
        }
    }
    
    /// The color style of the button, either green or blue.
    public var colorStyle: ColorStyle = .green {
        didSet {
            configure()
        }
    }
    
    /// The icon style of the button, either leading or trailing or none.
    private var iconStyle: IconStyle = .none {
        didSet {
            configureIconStyle()
        }
    }
    
    /// The font used for the button's title.
    public var font: UIFont? {
        didSet {
            titleLabel.font = font
        }
    }

    /// The font to be used when the button is highlighted.
    public var highlitedFont: UIFont?
    
    /// The leading icon to be used when the button is highlighted.
    public var highlitedLeadingIcon: UIImage?
    
    /// The trailing icon to be used when the button is highlighted.
    public var highlitedTrailingIcon: UIImage?

    /// The title of the button.
    @IBInspectable public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    /// The leading icon of the button.
    public var leadingIcon: UIImage? {
        didSet {
            iconStyle = .leading
            leadingIconContainer.isHidden  = false
            trailingIconContainer.isHidden = true
        }
    }

    /// The trailing icon of the button.
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
        configureButtonStyle()
        configureFont()
        configureIcon()
    }
    
    private func configureButtonStyle() {
        switch (type, colorStyle) {
        case (.primary, .green):
            configurePrimaryGreenStyle()
        case (.primary, .blue):
            configurePrimaryBlueStyle()
        case (.secondary, .green):
            configureSecondaryGreenStyle()
        case (.secondary, .blue):
            configureSecondaryBlueStyle()
        }
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
        leadingIconImageView.image = leadingIcon
        highlitedLeadingIcon = leadingIcon
        trailingIconContainer.isHidden = true
    }
    
    private func setupTrailingStyleForView() {
        trailingIconContainer.isHidden = false
        trailingIconImageView.image =  trailingIcon
        highlitedTrailingIcon = trailingIcon
        leadingIconContainer.isHidden = true
    }
}


// MARK: - Extensions

extension CustomBrandButton {
    
    /// The type of the button, either primary or secondary.
    public enum `Type` {
        case primary
        case secondary
    }
    
    /// The color style of the button, either green or blue.
    public enum ColorStyle {
        case green
        case blue
    }
    
    /// The style of the button, either leading or trailing or none.
    public enum IconStyle {
        case none
        case leading
        case trailing
    }
}
