//
//  FeedCell.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 15/06/21.
//

import Foundation
import UIKit

class FeedCell: UICollectionViewCell {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var nameLabel:  UILabel = UILabel(frame: CGRect.zero)

    override init(frame : CGRect) {
        super.init(frame : frame)
//        nameLabel.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
//        self.addSubview(self.nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        self.addConstraints([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        nameLabel.text = "test"
    }
}
