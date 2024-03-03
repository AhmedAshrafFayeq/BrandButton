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
            CustomBrandButtonRepresentable(
                title: "Button Title",
                buttonType: .primary,
                buttonColor: .green,
                buttonIconStyle: .leading,
                font: UIFont.systemFont(ofSize: 18),
                iconPosition: .trailing,
                iconImage: UIImage(systemName: "person.circle"),
                isEnabled: buttonEnabled,
                action: {
                    print("Button tapped")
                }
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
public struct CustomBrandButtonRepresentable: UIViewRepresentable {
    
    public typealias UIViewType = CustomBrandButton
    
    var title: String?
    var buttonType: CustomBrandButton.ButtonType
    var buttonColor: CustomBrandButton.ButtonColor
    var buttonIconStyle: CustomBrandButton.ButtonIconStyle
    var font: UIFont?
    var iconPosition: IconPosition
    var iconImage: UIImage?
    var isEnabled: Bool
    var action: () -> Void // Action closure
    
    public init(title: String?,
         buttonType: CustomBrandButton.ButtonType,
         buttonColor: CustomBrandButton.ButtonColor,
         buttonIconStyle: CustomBrandButton.ButtonIconStyle,
         font: UIFont?,
         iconPosition: IconPosition,
         iconImage: UIImage?,
         isEnabled: Bool,
         action: @escaping () -> Void){
        self.title = title
        self.buttonType = buttonType
        self.buttonColor = buttonColor
        self.buttonIconStyle = buttonIconStyle
        self.font = font
        self.iconPosition = iconPosition
        self.iconImage = iconImage
        self.isEnabled = isEnabled
        self.action = action // Assign action closure
    }
    
    public func makeUIView(context: Context) -> CustomBrandButton {
        let button = CustomBrandButton()
        button.configure(title: title,type: buttonType, color: buttonColor)
        button.font = font
        button.buttonIconStyle = buttonIconStyle
        button.isEnabled = isEnabled
        switch iconPosition {
        case .leading:
            button.leadingIcon = iconImage
        case .trailing:
            button.trailingIcon = iconImage
        }
        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
        return button
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.configure(title: title, type: buttonType, color: buttonColor)
        uiView.font = font
        uiView.buttonIconStyle = buttonIconStyle
        uiView.isEnabled = isEnabled
        switch iconPosition {
        case .leading:
            uiView.leadingIcon = iconImage
        case .trailing:
            uiView.trailingIcon = iconImage
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(action: action)
    }
    
    public class Coordinator: NSObject {
        var action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func buttonTapped() {
            action()
        }
    }
    
}

@available(iOS 13.0, *)
extension CustomBrandButtonRepresentable {
    public enum IconPosition {
        case leading
        case trailing
    }
}
