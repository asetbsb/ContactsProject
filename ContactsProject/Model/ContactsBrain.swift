//
//  ContactsBrain.swift
//  ContactsProject
//
//  Created by Asset on 10/24/24.
//

import Foundation
import UIKit

struct ContactBrain {
    var contacts = [
        Contact(name: "Yedige", color: .blue, phoneNumber: 87781234586),
        Contact(name: "Aman", color: .yellow, phoneNumber: 87753456789),
        Contact(name: "Sanya", color: .gray, phoneNumber: 87714323245),
        Contact(name: "Yersin", color: .green, phoneNumber: 87071231286),
        Contact(name: "Asset", color: .purple, phoneNumber: 87051444586),
        Contact(name: "Alisher", color: .orange, phoneNumber: 87011454586),
        Contact(name: "Amirzhan", color: .brown, phoneNumber: 87021974586),
    ]
    
    let colors = [
        UIColor.red,
        UIColor.green,
        UIColor.yellow,
        UIColor.blue,
        UIColor.brown,
        UIColor.gray,
        UIColor.orange,
        UIColor.purple,
    ]
}
