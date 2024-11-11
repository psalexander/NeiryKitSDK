//
//  UICollectionViewExtension.swift
//  FreePlayer
//
//  Created by Александр on 25.04.2023.
//

import UIKit

extension UICollectionView {
    func register(_ cellClass: AnyClass?, _ bundle: Bundle? = nil) {
        guard let cellClass = cellClass else {
            print("Cant register cell because cellClass is nil")
            return
        }
        let bundle = bundle ?? Bundle(for: cellClass.self)
        let cellIdentifier = String(describing: cellClass.self)
        let nib = UINib(nibName: cellIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    func registerWithoutNib(_ cellClass: AnyClass?) {
        guard let cellClass = cellClass else {
            print("Cant register cell because cellClass is nil")
            return
        }
        let ident = String(describing: cellClass.self)
        register(cellClass, forCellWithReuseIdentifier: ident)
    }

    func dequeueCell<T>(for indexPath: IndexPath) -> T {
        let cellIdentifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with type \(cellIdentifier)")
        }
        return cell
    }

    func dequeueSupplementaryView<T>(for kind: String, at indexPath: IndexPath) -> T {
        let ident = String(describing: T.self)
        guard let view = dequeueReusableSupplementaryView(ofKind: kind,
                                                          withReuseIdentifier: ident, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary view with type \(ident)")
        }
        return view
    }

    func isLast(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfItems(inSection: indexPath.section) - 1
    }

    func isFirst(_ indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
}
