# BrandButton
Welcome to the BrandButton documentation!


[![CI Status](https://img.shields.io/travis/ahmedashraffayeq/BrandButton.svg?style=flat)](https://travis-ci.org/ahmedashraffayeq/BrandButton)
[![Version](https://img.shields.io/cocoapods/v/BrandButton.svg?style=flat)](https://cocoapods.org/pods/BrandButton)
[![License](https://img.shields.io/cocoapods/l/BrandButton.svg?style=flat)](https://cocoapods.org/pods/BrandButton)
[![Platform](https://img.shields.io/cocoapods/p/BrandButton.svg?style=flat)](https://cocoapods.org/pods/BrandButton)


## Table of Contents
- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Getting Started](#getting-started)
- [Example](#example)
- [Author](#author)
- [License](#license)

## Introduction
CustomBrandButton is a custom UIControl subclass designed to create customizable buttons with brand-specific styles and icons.

![BrandButtonDemo](https://github.com/AhmedAshrafFayeq/BrandButton/assets/47187014/9d366db9-587e-4a49-8b90-9e429a558610)


## Requirements
OS 10.0+

Swift 5.0+

## Installation   
You can easily integrate BrandButton into your projects using one of the following methods:

*Method 1:*   *Swift Package Manager*

To integrate BrandButton into your iOS project using Swift Package Manager, follow these simple steps:

- Open Your Project: In Xcode  
- open your project workspace or project file where you want to add the framework.  
- Go to the "File" menu.   
- Select "Swift Packages."  
- Choose "Add Package Dependency..."  
- Enter the Repository URL:  
```
https://github.com/AhmedAshrafFayeq/BrandButton.git
```

- Click "Next & Finish"  
- Build and Run:  
- Xcode will automatically resolve and fetch the framework package.  
- Build and run your project to start using BrandButton in your application  

And that's it! You've successfully integrated BrandButton into your project using Swift Package Manager. 🚀

---

*Method 2:*   *Cocoapods*

To effortlessly integrate BrandButton into your iOS project using CocoaPods, follow these straightforward steps:  
First you need to install cocaopods, Here's a comprehensive guide on how to install cocoapods [ Cocoapods documentation ](https://guides.cocoapods.org/using/getting-started.html)  

After installing the Cocoapods successfully  

- Open the Podfile in a text editor and add the following line.
  ```
  pod 'BrandButton'
  ```

- Run the following command to install the framework and its dependencies:
 
 pod install

You can now import and use BrandButton in your iOS project. Xcode will handle the linking and configuration.  
And that's it! You've successfully integrated BrandButton into your project using CocoaPods. 🚀


## Getting Started
To use BrandButton in your project, follow these steps:
- UIKit:
1. Import the module wherever you need to use the custom button:

   ```swift
   import BrandButton
  
2. Ceate an instance of CustomBrandButton and customize its properties as needed:
    ```
    let brandButton = CustomBrandButton()
    brandButton.font = UIFont(name: "Helvetica-Regular", size: 15)
    brandButton.highlitedFont = UIFont(name: "Helvetica-Bold", size: 18)
    brandButton.leadingIcon = UIImage(named: "swift")
    brandButton.highlitedLeadingIcon = UIImage(named: "swift-2")
    secondaryBlueButton.isEnabled = false
    brandButton.addTarget(self, action: #selector(didTapBrandButton), for: .touchUpInside)
    ```

3. Add the button to your view hierarchy:
    ```
    view.addSubview(customButton)
   ```
4. Configure the button's layout constraints or frame according to your UI design.

  Customization

    Properties:
      title: The text displayed on the button.
      buttonType: The type of button (primary or secondary).
      buttonColor: The color scheme of the button (green or blue).
      leadingIcon: The image to be displayed before the button's title.
      trailingIcon: The image to be displayed after the button's title.
      font: The font used for the button's title.
      highlitedFont: The font used for the button's title when button's highlited.
      highlitedLeadingIcon: The image to be displayed before the button's title when button's highlited.
      highlitedTrailingIcon: The image to be displayed after the button's title when button's highlited.
      
      
- SwiftUI:
  1. Import the module wherever you need to use the custom button:

   ```swift
   import BrandButton
   ```
   2. Ceate an instance of BrandButtonView and customize its properties as needed:

    ```
    BrandButtonView(
                title: "Title",
                type: .primary,
                colorStyle: .green,
                iconStyle: .leading,
                font: UIFont.systemFont(ofSize: 18),
                iconImage: UIImage(systemName: "heart.fill"),
                isEnabled: true,
                highlitedFont: UIFont.systemFont(ofSize: 22),
                highlitedIcon: UIImage(systemName: "star.fill"
    )
    ```
  
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Author

ahmedashraffayeq, ahmedashraffayeq@gmail.com

## License

BrandButton is available under the MIT license. See the LICENSE file for more info.

