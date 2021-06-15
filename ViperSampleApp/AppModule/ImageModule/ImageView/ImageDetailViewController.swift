//
//  ImageDetailViewController.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

class ImageDetailViewController: UIViewController {
    
    var presenter: ImageDetailViewToPresenter?
    var titleString: String = ""
 
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPurple
        self.title = titleString
        presenter?.fetchImageDetail()
    }

}

extension ImageDetailViewController: ImageDetailPresenterToView {
    
    func fetchImageSucceed(){
        
    }
    
    func fetchImageError(){
        
    }

}
