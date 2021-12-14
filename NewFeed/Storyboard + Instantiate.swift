//
//  UIStoryboard + instantiate.swift
//  NewFeed
//
//  Created by Никита Троян on 11.12.2021.
//

import UIKit

extension UIStoryboard {
    
    //let myVC = UIStoryboard(.main).instantiate(MyViewController.self)
    //Note that you must ensure that each VC's Storyboard Identifier exactly matches its class name!
    
    enum Name: String {
        case main   = "Main"
        case launch = "LaunchScreen"
        case other  = "Other"
    }
    
    convenience init(_ name: Name, bundle: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: bundle)
    }
    
    func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
    
}
