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
    var imageView: UIImageView = {
        let image = UIImageView(image: .checkmark)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()


    override init(frame : CGRect) {
        super.init(frame : frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.addConstraints([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
         
    }
}
