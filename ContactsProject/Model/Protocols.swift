//
//  Protocols.swift
//  ContactsProject
//
//  Created by Asset on 10/26/24.
//

import Foundation
import UIKit

protocol ChangeAvatarColorDelegate: AnyObject {
    func changeButtonTapped(index: Int, color: UIColor)
    func viewDismissed(index: Int, name: String, number: Int?)
    func addNewContact(name: String, color: UIColor, number: Int?)
}
