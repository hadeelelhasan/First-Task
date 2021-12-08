//
//  ProfileViewController.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    /// Table View
    @IBOutlet weak var tableView: UITableView!

    /// view model
    private(set) var viewModel: UserProfileViewModel!
    
    /// my navigation bar
    private var myNavigationBar = NavigationBarView()
    
    /// user ID
    var userId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = UserProfileViewModel()
        self.setupTableView()
        self.fetchProfileData(forUserId: 73844) // user id
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.myNavigationBar = NavigationBarView(frame: CGRect(x:0, y:0, width:view.frame.size.width, height: 90))
        self.view.addSubview(myNavigationBar)
    }
    

       
    private func setupTableView() {
        SkillsTableViewCell.registerTableCellView(tableView: self.tableView)
        AboutTableViewCell.registerTableCellView(tableView: self.tableView)
        ExperienceTableViewCell.registerTableCellView(tableView: self.tableView)
        SectionHeaderTableView.registerHeaderView(tableView: self.tableView)
        MainHeaderTableView.registerHeaderView(tableView: self.tableView)
        AvailabilityTableViewCell.registerTableCellView(tableView: self.tableView)
        self.tableView.backgroundColor = #colorLiteral(red: 0.9449954033, green: 0.9451572299, blue: 0.9449852109, alpha: 1)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchProfileData(forUserId id: Int) {
        API.shared.fetchUserInfo(withId: id) { [weak self] userDate in
            guard let self = self, let userData = userDate else { return }
            self.viewModel.setUserData(userData)
            self.tableView.reloadData()
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let representable = self.viewModel.repesentableForRow(at: indexPath) else { return UITableViewCell() }
        
        if representable is AboutCellRepresentable {
            
            let aboutCellRrepresentable = representable as! AboutCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.getReuseIdentifier(), for: indexPath) as? AboutTableViewCell
            
            cell?.setup(representable: aboutCellRrepresentable)
            
            return cell ?? UITableViewCell()
            
        } else if representable is ExperienceCellRepresentable {
            
            let experienceCellRepresentable = representable as! ExperienceCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceTableViewCell.getReuseIdentifier(), for: indexPath) as? ExperienceTableViewCell
            
            cell?.setup(representable: experienceCellRepresentable)
            
            return cell ?? UITableViewCell()
        } else if representable is SkillsCellRepresentable {
            
            let skillsCellRepresentable = representable as! SkillsCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsTableViewCell.getReuseIdentifier(), for: indexPath) as? SkillsTableViewCell
            
            cell?.setup(representable: skillsCellRepresentable)
            
            return cell ?? UITableViewCell()
            
        } else if representable is AvailabilityCellRepresentable {
            
            let availabilityCellRepresentable = representable as! AvailabilityCellRepresentable
            
            let cell = tableView.dequeueReusableCell(withIdentifier: AvailabilityTableViewCell.getReuseIdentifier(), for: indexPath) as? AvailabilityTableViewCell
            
            cell?.setup(representable: availabilityCellRepresentable)
            
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    /**
    Get Height For Row At IndexPath
     - Parameters:
      - tableView: table view as UITableView
      - indexPath: indexPath for row as IndexPath
     - Returns: Row Height as CGFloat
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         self.viewModel.heightForRow(at: indexPath)
    }
    
    /**
    Get View For Header In Section
     - Parameters:
      - tableView: table view as UITableView
      - section: section number  as Int
     - Returns: View for Header as UIView
    */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerRepresentable = self.viewModel.headerRepersentableForSection(at: section)  else { return nil }
        
        if headerRepresentable is MainHeaderRepresentable {
            let headerRepresentable = headerRepresentable as! MainHeaderRepresentable
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainHeaderTableView.getReuseIdentifier()) as? MainHeaderTableView
            header?.setup(representable: headerRepresentable)
            return header ?? nil

        } else if headerRepresentable is SectionHeaderRepresentable {
            let headerRepresentable = headerRepresentable as! SectionHeaderRepresentable
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SectionHeaderTableView.getReuseIdentifier()) as? SectionHeaderTableView
            header?.setup(representable: headerRepresentable)
            return header ?? nil
        }
        return nil
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y /  self.viewModel.heightForSection(at: 0)
        
        if offset > 1 { offset = 1 }
        self.myNavigationBar.backgroundColor = .white.withAlphaComponent(offset)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1)
        self.myNavigationBar.setTitle(NSAttributedString(string: self.viewModel.getUserFullName(), attributes: [.foregroundColor: #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1), .font: UIFont.boldSystemFont(ofSize: 20)]))
        self.myNavigationBar.isTitleHidden = false

        if scrollView.contentOffset.y < 0.7 * self.viewModel.heightForSection(at: 0) {
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.myNavigationBar.isTitleHidden = true
        }
    }
    
    /**
    Get Height for  Header In Section
     - Parameters:
      - tableView: table view as UITableView
      - section: section number for header as Int
     - Returns: Header Height as CGFloat
    */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          self.viewModel.heightForSection(at: section)
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AboutTableViewCell {
            cell.setIsExpanded(!cell.isExpanded)
            tableView.reloadData()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
