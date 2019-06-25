//
//  AlertService.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 25.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    func showAlert(
        withTitle title: String = "",
        message: String = "",
        buttonTitle: String = "",
        preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil ) {
        
        let alerController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
            alerController.dismiss(animated: true, completion: nil)
        }
        alerController.addAction(okAction)
        
        self.present(alerController, animated: true, completion: nil)
    }
}
