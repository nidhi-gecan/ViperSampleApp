//
//  ImageInteractor.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 14/06/21.
//

import Alamofire
import Foundation

class ImageInteractor: ImageListPresenterToInteractorProtocol{
    
    weak var presenter: ImageListInteractorToPresenterProtocol?
            
    func fetchShapes() {
        AF.request(News.NEWS_URL).validate().responseJSON { response in
            
            guard response.error == nil else {
                print(response.error!)
                return
            }
            
            if response.response?.statusCode == 200 {
                guard let data = response.data else { print("No Data")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let feed = try decoder.decode(ImageEntity.self, from: data)
                    
                    guard let articles = feed.articles else { return }
                    self.presenter?.fetchedSucceed(shapeArrayList: articles)

                } catch {
                    print(error)
                    self.presenter?.fetchedError()
                }
            }
        }

    }
    
    func fetchImageDetail(){
        self.presenter?.fetchedImageDetailSuccess()
    }

}
