//
//  ImageDetailProtocol.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

protocol ImageDetailViewToPresenter: class {
    
    var interactor: ImageDetailPresenterToInteractor? { get set }
    var router: ImageDetailPresenterToRouter? { get set }
    var view: ImageDetailPresenterToView? {get set }
    
    func fetchImageDetail()
}

protocol ImageDetailPresenterToView: class {
    
    func fetchImageSucceed()
    func fetchImageError()
}

protocol ImageDetailPresenterToInteractor: class {
    
    var presenter: ImageDetailInteractorToPresenter? { get set }
    func fetchImageDetail()
}

protocol ImageDetailInteractorToPresenter: class {
    
    func fetchedSucceed()
    func fetchFailed()
}

protocol ImageDetailPresenterToRouter: class {
    
    static func createModule(with author: String) -> UIViewController
    
}
