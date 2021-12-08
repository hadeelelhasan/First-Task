//
//  UserProfileViewModel.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 24/11/2021.
//

import UIKit

class UserProfileViewModel {
    
    /// User Profile Sections
    enum UserProfileSections: String, CaseIterable {
        case mainHeader
        case about
        case experiences
        case skills
        case availability
    }
    
    /// Sections Representables
    private var sectionsRepresentables: [TableSectionRepresentable]
    
    /// user Data
    private var userData: UserData
        
    init() {
        sectionsRepresentables = []
        userData = UserData()
    }
    
    
    /**
     get user Id
     - Returns: user id as int
    */
    func getUserId() -> Int {
        return userData.userInfo.id
    }
    
    /**
     get user full name
    - Returns: user full name as string
     */
    func getUserFullName() -> String {
        return userData.userInfo.firstName + " " + userData.userInfo.lastName
    }
    
    /**
     Build Representables for Table View Sections
    */
    private func buildRepresentables() {
        
        // Iterate over each section
        for section in UserProfileSections.allCases {
            
            // Section Representable
            let sectionRepresentable = TableSectionRepresentable()

            switch section {
            case .mainHeader:
                sectionRepresentable.sectionHeaderRepresentable = MainHeaderRepresentable(userData: self.userData)
                sectionRepresentable.sectionHeaderRepresentable?.viewHeight = 300
                sectionRepresentable.cellsRepresentables = []
                
            case .about:
                sectionRepresentable.sectionHeaderRepresentable = SectionHeaderRepresentable(headerTitle: section.rawValue)
                let cellRepresentable = AboutCellRepresentable(About: self.userData.userInfo.about)
                sectionRepresentable.cellsRepresentables.append(cellRepresentable)
                sectionRepresentable.sectionHeaderRepresentable?.viewHeight = 30

            case .experiences:
                sectionRepresentable.sectionHeaderRepresentable = SectionHeaderRepresentable(headerTitle: section.rawValue)
                for experience in self.userData.experience {
                    sectionRepresentable.cellsRepresentables.append(ExperienceCellRepresentable(experience: experience))
                }
                sectionRepresentable.sectionHeaderRepresentable?.viewHeight = 30

                
            case .skills:
                sectionRepresentable.sectionHeaderRepresentable = SectionHeaderRepresentable(headerTitle: section.rawValue)
                let cellRepresentable = SkillsCellRepresentable(userSkills: self.userData.userSkill)
                sectionRepresentable.cellsRepresentables.append(cellRepresentable)
                sectionRepresentable.sectionHeaderRepresentable?.viewHeight = 30

                
            case .availability:
                sectionRepresentable.sectionHeaderRepresentable = SectionHeaderRepresentable(headerTitle: section.rawValue)
                let cellRepresentable = AvailabilityCellRepresentable(availability: self.userData.availability)
                sectionRepresentable.cellsRepresentables.append(cellRepresentable)
                sectionRepresentable.sectionHeaderRepresentable?.viewHeight = 30

            }

            // Append every Section Represntable to sectionsRepresantables list
            self.sectionsRepresentables.append(sectionRepresentable)
        }
    }
    
    
    /**
     set user data
     - Parameter userData: userData
     */
    public func setUserData(_ userData: UserData) {
        self.userData = userData
        buildRepresentables()
    }
    
    /**
     Numer Of Sections
     - Parameter tableView: tableview
     - Returns: number of sections as Int
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsRepresentables.count
    }
    
    /**
     Get number of rows in section
     - Parameter section: Section number as Int
     - Returns: Number of rows in section as Int
    */
    func numberOfRows(inSection section: Int) -> Int {
        return sectionsRepresentables[section].cellsRepresentables.count
    }
    
    /**
     Get cell representable for row at indexPath
     - Parameter indexPath: indexPath for row
     - Returns: Repersentable  at indexPath as Table View Cell Represenable
    */
    func repesentableForRow(at indexPath: IndexPath) -> TableViewCellRepresentable? {
        return indexPath.row < sectionsRepresentables[indexPath.section].cellsRepresentables.count ? sectionsRepresentables[indexPath.section].cellsRepresentables[indexPath.row] : nil
    }
    
    /**
    Get height for row at indexPath
     - Parameter indexPath: indexPath for row
     - Returns: height of row at indexPath as CGFloat
    */
    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        return repesentableForRow(at: indexPath)?.cellHeight ?? 0.0
    }
    
    
    /**
     Get header representable for section
     - Parameter section: section number as Int
     - Returns: Repersentable  as Table Header Footer View Rerpresentable
    */
    func headerRepersentableForSection(at section: Int) -> TableHeaderFooterViewRepresentable? {
        return section < sectionsRepresentables.count ? sectionsRepresentables[section].sectionHeaderRepresentable : nil
    }

    /**
    Get height for section at section number
     - Parameter section: section number as Int
     - Returns: height of section as CGFloat
    */
    func heightForSection(at section: Int) -> CGFloat {
        return headerRepersentableForSection(at: section)?.viewHeight ?? 0.0
    }
}
