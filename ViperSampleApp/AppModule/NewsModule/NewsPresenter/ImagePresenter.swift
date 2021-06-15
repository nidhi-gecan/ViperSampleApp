//
//  ImagePresenter.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation
import UIKit

class ImagePresenter: ImageListViewToPresenterProtocol{
    
    var view: ImageListPresenterToViewProtocol?
    var router: ImageListPresenterToRouterProtocol?
    var interactor: ImageListPresenterToInteractorProtocol?
    
    
    func startFetchingShapes(){
        interactor?.fetchShapes()
    }
    
    func showImageDetail(author: String){
        router?.pushToDetail(on: view!, author: author)
    }
}

extension ImagePresenter: ImageListInteractorToPresenterProtocol{
    
    func fetchedSucceed(shapeArrayList:Array<LiveNewsModel>){
        view?.fetchSuccess(shapeArrayList: shapeArrayList)
    }
    
    func fetchedError(){
        view?.fetchError()
    }
}
