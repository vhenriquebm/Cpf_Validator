//
//  Utils.swift
//  CpfValidator
//
//  Created by vitor henrique on 02/09/22.
//

import UIKit

struct Utils {
    
    static func presentAlert(title:String, message: String, actionMessage: String, controller: UIViewController, action: @escaping (UIAlertAction) -> () ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: actionMessage, style: .default, handler: action)
        
        alert.addAction(action)
        
        controller.present(alert, animated: true)
    }
}
