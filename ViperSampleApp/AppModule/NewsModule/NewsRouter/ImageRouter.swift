//
//  ImageRouter.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

class ImageRouter: ImageListPresenterToRouterProtocol{
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ImageListViewToPresenterProtocol & ImageListInteractorToPresenterProtocol = ImagePresenter()
        let interactor: ImageListPresenterToInteractorProtocol = ImageInteractor()
        let router: ImageListPresenterToRouterProtocol = ImageRouter()

        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }

    // MARK: - Navigation
    func pushToDetail(on view: ImageListPresenterToViewProtocol) {
        let imageDetailViewController = ImageDetailRouter.createModule()
            
        let viewController = view as! ViewController
        viewController.navigationController?
            .pushViewController(imageDetailViewController, animated: true)
        
    }

}

