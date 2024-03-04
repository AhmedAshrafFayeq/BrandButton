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
                type: .primary,
                colorStyle: .green,
                iconStyle: .leading,
                font: UIFont.systemFont(ofSize: 18),
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
    var type: CustomBrandButton.`Type`
    var colorStyle: CustomBrandButton.ColorStyle
    var iconStyle: CustomBrandButton.IconStyle
    var font: UIFont?
    var iconImage: UIImage?
    var isEnabled: Bool
    
    public init(title: String?,
         type: CustomBrandButton.`Type`,
         colorStyle: CustomBrandButton.ColorStyle,
         iconStyle: CustomBrandButton.IconStyle,
         font: UIFont?,
         iconImage: UIImage?,
         isEnabled: Bool) {
        self.title = title
        self.type = type
        self.colorStyle = colorStyle
        self.iconStyle = iconStyle
        self.font = font
        self.iconImage = iconImage
        self.isEnabled = isEnabled
    }
    
    public func makeUIView(context: Context) -> CustomBrandButton {
        let button = CustomBrandButton()
        button.title = title
        button.type = type
        button.colorStyle = colorStyle
        button.font = font
        button.isEnabled = isEnabled
        switch iconStyle {
        case .leading:
            button.leadingIcon = iconImage
        case .trailing:
            button.trailingIcon = iconImage
        case .none: break
        }
        return button
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.title = title
        uiView.type = type
        uiView.colorStyle = colorStyle
        uiView.font = font
        uiView.isEnabled = isEnabled
        switch iconStyle {
        case .leading:
            uiView.leadingIcon = iconImage
        case .trailing:
            uiView.trailingIcon = iconImage
        case .none: break
        }
    }
}
