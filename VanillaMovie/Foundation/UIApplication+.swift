//
//  UIApplication+.swift
//  SimpleMovie
//
//  Created by pineone on 2022/05/12.
//

import UIKit

extension UIApplication {
    
    var keyWindowName: String {
        var returnValue = ""
        if let instance = UIWindow.key {
            returnValue = String(describing: type(of: instance))
        }
        return returnValue
    }
    
    
    var isiPhonexDevice: Bool {
        if (UIWindow.keySafeAreaInsets.bottom) > CGFloat(0.0) {
            return true
        }
        return false
    }
    
    var keyWindowInConnectedScenes: UIWindow? {
        if #available(iOS 13.0, *) {
           return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        } else {
           return UIApplication.shared.keyWindow
        }
    }
}

extension UIApplication {
    
    func isTopViewControllerActionSheet(topVC: UIViewController?) -> Bool {
        return (topVC as? UIAlertController)?.preferredStyle == .actionSheet
    }
}

