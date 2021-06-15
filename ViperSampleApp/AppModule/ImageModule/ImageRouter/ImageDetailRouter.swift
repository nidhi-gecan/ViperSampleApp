//
//  ImageDetailRouter.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

class ImageDetailRouter: ImageDetailPresenterToRouter {
    
    // MARK: Static methods
    static func createModule(with author: String) -> UIViewController {
        
        let viewController = ImageDetailViewController()
        viewController.titleString = author
        let presenter: ImageDetailViewToPresenter & ImageDetailInteractorToPresenter = ImageDetailPresenter()
        let interactor: ImageDetailPresenterToInteractor = ImageDetailInteractor()
        let router: ImageDetailPresenterToRouter = ImageDetailRouter()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
}
