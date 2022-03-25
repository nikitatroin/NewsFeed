//
//  Cell+Reusable.swift
//  NewFeed
//
//  Created by Никита Троян on 17.12.2021.
//

import Foundation
import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    static var reuseID: String {
        return String(describing: self)
    }
}
