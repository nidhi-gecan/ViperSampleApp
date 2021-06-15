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
    static func createModule() -> UIViewController {
        
        let viewController = ImageDetailViewController()
        
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
