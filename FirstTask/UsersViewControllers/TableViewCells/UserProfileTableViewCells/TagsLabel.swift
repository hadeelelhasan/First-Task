//
//  SkillLabel.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 29/11/2021.
//

import UIKit

class UITagLabel: UILabel {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.2916044295, green: 0.5656878948, blue: 0.8853569627, alpha: 1)
        self.layer.cornerRadius = 5
        self.textAlignment = .center
        self.numberOfLines = 0
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
       var size = super.sizeThatFits(size)
        size.width += 10
        size.height += 10
        return size
    }
}
