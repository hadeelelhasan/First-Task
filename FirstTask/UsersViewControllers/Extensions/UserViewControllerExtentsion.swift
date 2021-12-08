//
//  UserViewControllerExtentsion.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import UIKit

// MARK: - Users View Controller Extension
extension UsersViewController: UITableViewDataSource {
    
    /**
     Number Of Rows In Section
     - Parameters:
      - tableView: Table View as UITableView
      - section: Section number as Int
     - Returns: number of rows as Int
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
        
    /**
     Cell For Row At
     - Parameters:
       - tableView: Table View as UITableView
       - indexPath: indexPath as IndexPath
     - Returns: Cell as UITableViewCell
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let representable = self.viewModel.representableForRow(at: indexPath) else { return UITableViewCell() }
        if representable is UserTableViewCellRepresentable {
            
            let representable = representable as! UserTableViewCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.getReuseIdentifier(), for: indexPath) as? UserTableViewCell
            
            cell?.setup(representable: representable)

            return cell ?? UITableViewCell()
            
        } else if representable is LoadingTableViewCellRepresentable {
            
            let representable = representable as! LoadingTableViewCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.getReuseIdentifier(), for: indexPath) as? LoadingTableViewCell
            cell?.setup(representable: representable)
                        
            return cell ?? UITableViewCell()
            
        }
        return UITableViewCell()
    }
    
    
    /**
     Will Display
     - Parameters:
       - tableView: Table View as UITableView
       - cell: cell as UITableViewCell
      - indexPath: indexPath as IndexPath
     */
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.representableForRow(at: indexPath) is LoadingTableViewCellRepresentable {
            fetchUserData(refreshData: false, offset: viewModel.getOffset())
            //fetchData(offset: viewModel.getOffset())
        } 
    }
    
    
    /**
     Height For Row At
    - Parameters:
       - tableView: Table View as UITableView
       - indexPath: indexPath as IndexPath
    - Returns: height as CGFloat
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.viewModel.heightForRow(tableView: tableView, at: indexPath)
    }
    
}

extension UsersViewController: UITableViewDelegate {
    
    /** Did Select Row At
     - Parameters:
       - tableView: tableView as UITableView
       - indexPath: indexPath as IndexPath
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        if let representable = self.viewModel.representableForRow(at: indexPath) as? UserTableViewCellRepresentable {
            
            let profileViewController = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
            profileViewController.userId = representable.id
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }

    }
    
    
}

