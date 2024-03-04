//
//  CustomBrandButtonRepresentable.swift
//  BrandButton
//
//  Created by Ahmed Fayek on 03/03/2024.
//

import SwiftUI

@available(iOS 13.0, *)
struct CustomBrandButtonRepresentableExample: View {
    
    @State var buttonEnabled = true
    
    var body: some View {
        VStack {
            Text("Hello, BrandButton in SwiftUI")
            BrandButtonView(
                title: "Button Title",
                buttonType: .primary,
                buttonColor: .green,
                buttonIconStyle: .leading,
                font: UIFont.systemFont(ofSize: 18),
                iconPosition: .trailing,
                iconImage: UIImage(systemName: "person.circle"),
                isEnabled: buttonEnabled
            )
                .frame(width:250, height: 45)
        }
    }
}

@available(iOS 13.0, *)
struct CustomBrandButtonRepresentableExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomBrandButtonRepresentableExample()
    }
}


@available(iOS 13.0, *)
public struct BrandButtonView: UIViewRepresentable {
    
    public typealias UIViewType = CustomBrandButton
    
    var title: String?
    var buttonType: CustomBrandButton.`Type`
    var buttonColor: CustomBrandButton.ColorStyle
    var buttonIconStyle: CustomBrandButton.IconStyle
    var font: UIFont?
    var iconPosition: IconPosition
    var iconImage: UIImage?
    var isEnabled: Bool
    
    public init(title: String?,
         buttonType: CustomBrandButton.`Type`,
         buttonColor: CustomBrandButton.ColorStyle,
         buttonIconStyle: CustomBrandButton.IconStyle,
         font: UIFont?,
         iconPosition: IconPosition,
         iconImage: UIImage?,
         isEnabled: Bool) {
        self.title = title
        self.buttonType = buttonType
        self.buttonColor = buttonColor
        self.buttonIconStyle = buttonIconStyle
        self.font = font
        self.iconPosition = iconPosition
        self.iconImage = iconImage
        self.isEnabled = isEnabled
    }
    
    public func makeUIView(context: Context) -> CustomBrandButton {
        let button = CustomBrandButton()
        button.title = title
        button.type = buttonType
        button.colorStyle = buttonColor
        button.font = font
        button.isEnabled = isEnabled
        switch iconPosition {
        case .leading:
            button.leadingIcon = iconImage
        case .trailing:
            button.trailingIcon = iconImage
        }
        return button
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.title = title
        uiView.type = buttonType
        uiView.colorStyle = buttonColor
        uiView.font = font
        uiView.isEnabled = isEnabled
        switch iconPosition {
        case .leading:
            uiView.leadingIcon = iconImage
        case .trailing:
            uiView.trailingIcon = iconImage
        }
    }
}

@available(iOS 13.0, *)
extension BrandButtonView {
    public enum IconPosition {
        case leading
        case trailing
    }
}
