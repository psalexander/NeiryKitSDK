//
//  UIViewControllerExtension.swift
//
//  Created by Александр on 20.07.2022.
//

import UIKit

extension UIViewController {
    //Root viewcontroller
    static func storyboardInstance<T>() -> T {
        let storyboard = UIStoryboard(name: String(describing: T.self), bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? T else {
            fatalError("[VC] \(String(describing: T.self)) is not initial in storyboard")
        }
        return viewController
    }

    static func storyboardiPadInstance<T>() -> T {
        let storyboard = UIStoryboard(name: String(describing: "\(T.self)_ipad"), bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? T else {
            fatalError("[VC] \(String(describing: T.self)) is not initial in storyboard")
        }
        return viewController
    }

    //Controller in storyboard by ident
    static func storyboardVC<T>(storyboarName name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("[VC] \(String(describing: T.self)) does not exists in storyboard \(name)")
        }
        return viewController
    }
}
