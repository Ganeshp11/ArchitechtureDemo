//
//  UIDevice+Extension.swift
//  Dewing Grain
//
//  Created by Pooja Aher on 03/07/20.
//  Copyright © 2020 amarsingh. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    enum ScreenType: String {
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPhoneXr
        case iPhonePro
        case iPad
    }
    
    static var screenType: ScreenType {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                case 1136:
                    return .iPhone5
                case 1334:
                    return .iPhone6
                case 1920, 2208:
                    return .iPhone6Plus
                case 2436, 1792:
                    return .iPhoneX
                case 2688:
                    return .iPhonePro
                default:
                    return .iPhone6
            }
        } else {
            return .iPad
        }
    }
}
