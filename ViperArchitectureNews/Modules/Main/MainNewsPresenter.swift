//
//  MainNewsPresenter.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

protocol MainNewsPresenterDelegate: AnyObject {
    func updateUI(viewModels: [NewsViewModel])
}

protocol MainNewsPresenterProtocol: AnyObject {
    var view: MainNewsPresenterDelegate? { get }
    func prepareNews()
}

final class MainNewsPresenter: MainNewsPresenterProtocol {
    weak var view: MainNewsPresenterDelegate?
    private let mainNewsInteractor: MainNewsInteractorProtocol
    private let mapper: NewsViewModelMapper
    
    private var newsModels: [Article] = []
    private var newsViewModels: [NewsViewModel] = []
    
    init(mainNewsInteractor: MainNewsInteractorProtocol,
         mapper: NewsViewModelMapper) {
        self.mainNewsInteractor = mainNewsInteractor
        self.mapper = mapper
    }
    
    func prepareNews() {
        mainNewsInteractor.fetchNews { result in
            switch result {
            case .success(let newsData):
                self.newsModels = newsData.articles
                self.newsViewModels = self.newsModels.map(self.mapper.map(entity:))
                self.view?.updateUI(viewModels: self.newsViewModels)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
