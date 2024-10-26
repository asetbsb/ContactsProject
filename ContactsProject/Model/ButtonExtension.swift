//
//  ButtonExtension.swift
//  ContactsProject
//
//  Created by Asset on 10/24/24.
//

import Foundation
import UIKit

extension UIButton {
    func applyDesign() {
        self.layer.cornerRadius = 12
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    func titleForNormal(title: String) {
        self.setTitle(title, for: .normal)
    }
}
