//
//  ImageDetailPresenter.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation

class ImageDetailPresenter: ImageDetailViewToPresenter {
    
    weak var view: ImageDetailPresenterToView?
    var router: ImageDetailPresenterToRouter?
    var interactor: ImageDetailPresenterToInteractor?
    
    func fetchImageDetail(){
        
    }
}

extension ImageDetailPresenter: ImageDetailInteractorToPresenter {
    
    func fetchedSucceed(){
        
    }
    
    func fetchFailed(){
        
    }

}
