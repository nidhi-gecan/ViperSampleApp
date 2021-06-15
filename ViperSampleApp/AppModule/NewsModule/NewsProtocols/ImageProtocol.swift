//
//  ImageProtocol.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

protocol ImageListViewToPresenterProtocol: class {
    
   var view: ImageListPresenterToViewProtocol? {get set}
    var interactor: ImageListPresenterToInteractorProtocol? {get set}
    var router: ImageListPresenterToRouterProtocol? {get set}

    func startFetchingShapes()
    func showImageDetail()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
}

protocol ImageListPresenterToViewProtocol: class {
    
    func fetchSuccess(shapeArrayList:Array<LiveNewsModel>)
    func fetchError()
    
}

protocol ImageListPresenterToInteractorProtocol: class {
    var presenter:ImageListInteractorToPresenterProtocol? {get set}
    func fetchShapes()
    func fetchImageDetail()
}

protocol ImageListInteractorToPresenterProtocol: class {
    func fetchedSucceed(shapeArrayList:Array<LiveNewsModel>)
    func fetchedError()
    
    func fetchedImageDetailSuccess()
    func fetchedImageDetailError()

}

protocol ImageListPresenterToRouterProtocol: class {
    static func createModule() -> UINavigationController
    func pushToDetail(on view: ImageListPresenterToViewProtocol)
}
