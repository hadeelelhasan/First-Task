//
//  NavigationBar.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 07/12/2021.
//

import UIKit

class NavigationBarView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    
    var isTitleHidden: Bool {
        set {
            self.titleLabel.isHidden = newValue
        }
        get {
            return self.titleLabel.isHidden
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commenInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commenInit()
    }
    
    private func commenInit() {
        Bundle.main.loadNibNamed("NavigationBarView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.backgroundColor = UIColor.clear
    }

    public func setTitle(_ title: NSAttributedString) {
        self.titleLabel.attributedText = title
    }
    
}
