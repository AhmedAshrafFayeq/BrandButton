//
//  SwiftUIView.swift
//  BrandButton_Example
//
//  Created by Ahmed Fayek on 03/03/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import BrandButton

@available(iOS 13.0, *)
struct SwiftUIView: View {
    
    var body: some View {
        VStack {
            Text("Hello, From Example File!")
            BrandButtonView(
                title: "Title",
                type: .primary,
                colorStyle: .green,
                iconStyle: .leading,
                font: UIFont.systemFont(ofSize: 18),
                iconImage: UIImage(systemName: "heart.fill"),
                isEnabled: true,
                highlitedFont: UIFont.systemFont(ofSize: 22),
                highlitedIcon: UIImage(systemName: "star.fill")
            ) .frame(width: 180, height: 45)
                .onTapGesture {
                    print("hello")
                }
        }

    }
}

@available(iOS 13.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
