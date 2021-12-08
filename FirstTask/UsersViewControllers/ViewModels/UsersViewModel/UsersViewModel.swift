//
//  UserViewModel.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit

// MARK: - Users View Model
class UsersViewModel {
    
    /// Representables
    private var representables: [TableViewCellRepresentable]

    /// Users
    private var users: [User]
    
    /// Number of hits
    private var hits: Int
    
    /// is Loading
    private var isLoading = false
    
    /**
     Defult Initalisers
     - Parameter users: List of Results
     */
    init() {
        self.users = []
        self.hits = 0
        self.representables = [LoadingTableViewCellRepresentable(hasData: false)]
    }
    
    /**
    Build Representable
     - parameters newUsers :  as [User]
    */
    private func buildRepresentables(newUsers: [User], offset: Int) {
        if self.users.count < hits {
            if self.representables.last is LoadingTableViewCellRepresentable {
                self.representables.removeLast()
            }
            let newRepresentables = newUsers.map({ UserTableViewCellRepresentable(user: $0) })
            self.representables.insert(contentsOf: newRepresentables, at: offset)
            self.representables.append(LoadingTableViewCellRepresentable(hasData: true))
        }
    }
        
    /**
     Update Users
     - Parameter updatedUsers: updateUsers as [User]
    */
    public func updateUsers(_ updatedUsers: [User], _ offset: Int) {
        self.users.append(contentsOf: updatedUsers)
        self.buildRepresentables(newUsers: updatedUsers, offset: offset)
    }
    
    /**
     Update Hits
     - Parameter hits: number of hits as Int
    */
    public func updateHits(_ hits: Int) {
        self.hits = hits
    }
    
    /**
     Update is Loading Status
    - Parameter isLoading: isLoading status as boolean
    */
    public func updateLoadingStatus(_ isLoading: Bool) {
        self.isLoading =  isLoading
    }
    
    /**
     Get Loading Status
     - Returns: is loading status as boolean
     */
    public func getLoadingStatus() -> Bool {
        return isLoading
    }
    
    /**
     Get Offset
     - Returns: offset as Int
     */
    func getOffset() -> Int {
        return self.users.count
    }
       
    /**
     Reset Users
     */
    func resetUsers() {
        self.users = []
        self.representables = []
    }
    
    func getUserId(at indexPath: IndexPath) -> Int {
        return users[indexPath.row].id
    }
    
    /**
     Get number of rows in section
     - Parameter section: Section number as Int
     - Returns: Number of rows in section as Int
    */
    func numberOfRows(inSection section: Int) -> Int {
        return representables.count
    }
    
    /**
     Get cell representable for row at indexPath
     - Parameter indexPath: indexPath for row
     - Returns: Repersentable  at indexPath as Table View Cell Represenable
    */
    func representableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return indexPath.row < representables.count ? representables[indexPath.row] : nil
    }
    
    /**
    Get height for row at indexPath
     - Parameter indexPath: indexPath for row
     - Returns: height of row at indexPath as CGFloat
    */
    func heightForRow(tableView: UITableView, at indexPath: IndexPath) -> CGFloat {
        if let cellRepresentable = representableForRow(at: indexPath) as? LoadingTableViewCellRepresentable, !cellRepresentable.hasData {
            return tableView.frame.height
        } else {
            return representableForRow(at: indexPath)?.cellHeight ?? 0.0
        }
    }
}
