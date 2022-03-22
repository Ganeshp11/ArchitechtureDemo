//
//  Theme.swift
//  EngagePro
//
//  Created by webwerks on 17/01/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import Foundation
import UIKit

enum FontName: String {
    case Regular = "GothamBook"
    case Medium = "GothamMedium"
    case Bold = "GothamBold"
}

enum FontSize:String {
    case FontSize11
    case FontSize12
    case FontSize13
    case FontSize14
    case FontSize15
    case FontSize16
    case FontSize17
    case FontSize18
    case FontSize19
    case FontSize20
    case FontSize22
    case FontSize24
    case FontSize45
    case FontSize30
    case FontSize60
}

struct Theme {
    
    struct Color {
        //App theme color
        static let shad = UIColor(hexString: "#D3CBA9")
        static let normalTextColor = UIColor(hexString: "#000000")
        static let headerColor = UIColor(hexString: "#FFFFFF")
        static let linkTextColor = UIColor(hexString: "#715F19")
        static let primaryTextColor = UIColor(hexString: "#333333")
        static let secondaryTextColor = UIColor(hexString: "#666666")
        static let lightTextColor = UIColor(hexString: "#999999")
        static let primaryButtonColor = UIColor(hexString: "#3F3B2B")
        static let backgroundColor = UIColor(hexString: "#F7F7F8")
        static let redColor = UIColor(hexString: "#EE0000")
        static let lightGrayColor = UIColor(hexString: "#ACACAC")
        static let lightGrayCellColor = UIColor(hexString: "#F6F4EC")
        static let sliderMaxColor = UIColor(hexString: "#E5E5E5")
        static let buttonInactiveColor = UIColor(hexString: "#CECDC9")
        static let tradingHeaderColor = UIColor(hexString: "#93aabe")
        static let tradingDetail1Color = UIColor(hexString: "#93aabe",alpha: 0.25)
        static let expiredColor = UIColor(hexString: "#a60036")
        static let bidSentColor = UIColor(hexString: "#009850")
        static let accepetColor = UIColor(hexString: "#FCBA00")
        static let rejectColor = UIColor(hexString: "#F50000")
        static let pendingColor = UIColor(hexString: "#fa7d09")
        static let accountSummaryBgColor = UIColor(hexString: "#EFEFEF")
        static let acceptBidColor = UIColor(hexString: "#5f8923")
        static let incrementColor = UIColor(hexString: "#00672e")
        static let decrementColor = UIColor(hexString: "#ffff0000")
        static let rejectBidColor = UIColor(hexString: "#f25d49")
        static let marketSelectionColor = UIColor(hexString: "#F3F1E8")
        static let notificationLblColor = UIColor(hexString: "#000000")
        static let notificationSwitchColor = UIColor(hexString: "#D1CBAA")
        static let notificationToggleColor = UIColor(hexString: "#3B3929")
        static let viewBackgroundColor = UIColor.init(hexString: "#D0D6DB")
        static let getOtpDisable = UIColor.init(hexString: "#cecdc9")
        static let separatorColor = UIColor.init(hexString: "#3f452b")
        static let oceanBlueColor = UIColor.init(hexString: "#0070A5")
        static let greyishBrown = UIColor.init(hexString: "#3f3b2b")
        static let redishColor = UIColor.init(hexString: "#d90d15")
        static let bidButtonBorderColor = UIColor.init(hexString: "#888c49")
         
    }
    
    struct Font {
        static var fontSizeArray = [String:Any]()
        
        static func getFont(_ name:FontName,_ size: FontSize) -> UIFont {
            let fontSize = getFontSize(fontSize: size)
            let font = UIFont(name: name.rawValue, size: fontSize)
            return font ?? UIFont.systemFont(ofSize: fontSize)
        }
        
        static func getFontSize(fontSize: FontSize) -> CGFloat {
            readPlistFile()
            if let fontSize = fontSizeArray[fontSize.rawValue] as? String,
                let value = Double(fontSize) {
                return CGFloat(value)
            }
            return CGFloat(12)
        }
        
        static func readPlistFile() {
            if fontSizeArray.isEmpty {
                var fileName = "iPhone6"
                switch UIDevice.screenType {
                    case .iPhone5:
                        fileName = UIDevice.ScreenType.iPhone5.rawValue
                    case .iPhone6:
                        fileName = UIDevice.ScreenType.iPhone6.rawValue
                    case .iPhone6Plus:
                        fileName = UIDevice.ScreenType.iPhone6Plus.rawValue
                    case .iPhoneX:
                        fileName = UIDevice.ScreenType.iPhoneX.rawValue
                    case .iPhoneXr:
                        fileName = UIDevice.ScreenType.iPhoneXr.rawValue
                    case .iPhonePro:
                        fileName = UIDevice.ScreenType.iPhonePro.rawValue
                    case .iPad:
                        fileName = UIDevice.ScreenType.iPad.rawValue
                }
                
                if let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "plist"),
                    let data = try? Data(contentsOf: fileUrl) {
                    if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String:Any] {
                        fontSizeArray = result
                    }
                }
            }
        }
    }
}

