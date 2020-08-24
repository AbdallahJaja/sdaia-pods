//
//  UITableView+Reuse.swift
//  Tawakkalna
//
//  Created by Saleh AlDhobaie on 21/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import Foundation
import UIKit

// MARK: UITableView+Reuse
public extension UITableView {

    /// Dequeues a cell, assuming the identifier is equal to `cellType` for a given `indexPath`.
    ///
    /// - parameter cellType: The type of cell to dequeue.
    /// - parameter indexPath: The indexPath of the cell being dequeued.
    /// - returns: The dequeued cell.
    func dequeueCell<T: UITableViewCell>(ofType cellType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: "\(cellType)", for: indexPath) as! T
    }

    /// Registers a cell loaded from a nib. Assumes the nib's name is equal to `cellType`. Can be dequeued using the
    /// `cellType` as an identifier.
    ///
    /// - parameter cellType: The type of cell to register.
    func registerNibCell<T: UITableViewCell>(ofType cellType: T.Type) {
        let nib = UINib(nibName: "\(cellType)", bundle: nil)
        register(nib, forCellReuseIdentifier: "\(cellType)")
    }

    /// Dequeues a header/footer, assuming the identifier is equal to `headerFooterType`.
    ///
    /// - parameter headerFooterType: The type of header/footer to dequeue.
    /// - returns: The dequeued header/footer.
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(ofType headerFooterType: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: "\(headerFooterType)") as! T
    }

    /// Registers a header/footer loaded from a nib. Assumes the nib's name is equal to `headerFooterType`. Can be
    /// dequeued using the `headerFooterType` as an identifier.
    ///
    /// - parameter headerFooterType: The type of header/footer to register.
    func registerNibHeaderFooter<T: UITableViewHeaderFooterView>(ofType headerFooterType: T.Type) {
        let nib = UINib(nibName: "\(headerFooterType)", bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: "\(headerFooterType)")
    }
}
