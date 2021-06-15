//
//  ImagePresenter.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Foundation

class ImagePresenter: ImageListViewToPresenterProtocol{
    
    var view: ImageListPresenterToViewProtocol?
    var router: ImageListPresenterToRouterProtocol?
    var interactor: ImageListPresenterToInteractorProtocol?
    
    var feedArticles: [LiveNewsModel]?
    var articlesTitle: [String]?

    
    func startFetchingShapes(){
        interactor?.fetchShapes()
    }
    
    func showImageDetail(){
        interactor?.fetchImageDetail()
    }
    
    // MARK: - Populate Data to Collection
    func numberOfRowsInSection() -> Int {
        guard let articlesTitle = self.articlesTitle else {
            return 0
        }
        
        return articlesTitle.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let articlesTitle = self.articlesTitle else {
            return nil
        }
        
        return articlesTitle[indexPath.row]
    }

}

extension ImagePresenter: ImageListInteractorToPresenterProtocol{
    
    func fetchedSucceed(shapeArrayList:Array<LiveNewsModel>){
        self.feedArticles = shapeArrayList
        self.articlesTitle = shapeArrayList.compactMap { $0.title }
        view?.fetchSuccess(shapeArrayList: shapeArrayList)
    }
    
    func fetchedError(){
        view?.fetchError()
    }
    
    func fetchedImageDetailSuccess(){
        router?.pushToDetail(on: view!)
    }
    
    func fetchedImageDetailError(){
        
    }

}
