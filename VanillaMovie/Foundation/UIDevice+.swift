//
//  UIDevice+.swift
//  SimpleMovie
//
//  Created by pineone on 2022/05/12.
//

import UIKit

extension UIDevice {
    
    var detailedModel: String {
        var sysinfo = utsname()
        uname(&sysinfo)
        return String(
                bytesNoCopy: &sysinfo.machine,
                length: Int(_SYS_NAMELEN),
                encoding: .ascii,
                freeWhenDone: false)!
            .trimmingCharacters(
                in: CharacterSet(charactersIn: "\0")
            )
    }
    
    var isNotSupportedModel: Bool {
        switch detailedModel {
        case "iPhone8,4": return true
        default: return false
        }
    }
    
    static let topSafeArea =  Int(UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.top ?? 0)
    static let leftSafeArea = Int(UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.left ?? 0)
    static let rightSafeArea = Int(UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.right ?? 0)
    static let bottomSafeArea: Int = Int(UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.bottom ?? 0)
    
}

