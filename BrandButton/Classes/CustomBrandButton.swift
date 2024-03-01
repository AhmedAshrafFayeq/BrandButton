//
//  CustomBrandButton.swift
//  CustomBrandButton
//
//  Created by Ahmed Fayek on 29/02/2024.
//

import UIKit

@IBDesignable public class CustomBrandButton: UIView {
    // MARK: - IBOutlets
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var leadingIconContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leadingIconImageView: UIImageView!
    @IBOutlet weak var trailingIconContainer: UIView!
    @IBOutlet weak var trailingIconImageView: UIImageView!
    
    // MARK: - Variables
//    @IBInspectable var bgColor: UIColor? {
//        set { containerView.backgroundColor = newValue }
//        get { return containerView.backgroundColor }
//    }
//    @IBInspectable var title: String? {
//        set { titleLabel.text = newValue }
//        get { return titleLabel.text }
//    }
//
//    @IBInspectable var labelFontSize: Int = 15 {
//        didSet {
//            lblFontSize = labelFontSize
//            configureView()
//        }
//    }
    
    var buttonType: BrandButtonType = .primaryGreen
    var buttonState: BrandButtonState = .normal
    var buttonIconStyle: BrandButtonIcon = .default
    var lblFontSize: Int = 15
    var buttonBgColor: UIColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    var labelColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    
    
    // Image for leading icon
    public var leadingIcon: UIImage? {
        didSet {
            leadingIconContainer.isHidden = false
            leadingIconImageView.image = leadingIcon
            trailingIconContainer.isHidden = true
        }
    }
    // Image for trailing icon
    public var trailingIcon: UIImage? {
        didSet {
            trailingIconContainer.isHidden = false
            trailingIconImageView.image = trailingIcon
            leadingIconContainer.isHidden = true
        }
    }
    
    public var isPressed: Bool? {
        didSet {
            buttonState = isPressed ?? false ? .pressed : .normal
            configure()
        }
    }
    
    public var fontSize: Int? {
        didSet {
            titleLabel.font = titleLabel.font.withSize(CGFloat(fontSize ?? 15))
            configure()
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
    }
    
    public func configure(title: String, type: BrandButtonType){
        titleLabel.text = title
        buttonType = type
        configure()
    }
    
    private func configure() {

        switch buttonType {
        case .primaryGreen:
            titleLabel.textColor = .white
            containerView.backgroundColor = buttonState == .normal ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            
        case .primaryBlue:
            titleLabel.textColor = .white
            containerView.backgroundColor = buttonState == .normal ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
         case .primaryDisable:
            break
            
        case .secondaryGreen, .secondaryBlue, .secondaryDisable:
            break
        }
    }
    
}



public enum BrandButtonType: Int {
    //primary
    case primaryGreen = 1
    case primaryBlue
    case primaryDisable
    //secondary
    case secondaryGreen
    case secondaryBlue
    case secondaryDisable
}


public enum BrandButtonState: Int {
    case normal = 0
    case pressed
}

public enum BrandButtonIcon: Int {
    case `default` = 0
    case leading
    case trailing
}
