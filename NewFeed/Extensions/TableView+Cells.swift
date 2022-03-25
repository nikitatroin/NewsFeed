//
//  TableView+Cells.swift
//  NewFeed
//
//  Created by Никита Троян on 17.12.2021.
//

import UIKit

extension UITableView {
    
    func registerCell <Cell:UITableViewCell> (_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseID)
    }
    
    func dequeueReusableCell <Cell: UITableViewCell> (forIndexPath indexPath:IndexPath) -> Cell
    {
        guard let cell =
        self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell
        else {fatalError("Fatal error for cell at \(indexPath)")}
        
        return cell
    }
}
