//
//  MainNewsInteractor.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

protocol MainNewsInteractorProtocol: AnyObject {
    func fetchNews(completion: @escaping (Result<MainNewsEntity, NetworkServiceErrors>) -> Void)
}

final class MainNewsInteractor: MainNewsInteractorProtocol {
    private let newsNetworkService: NewsNetworkServiceProtocol
    
    init(newsNetworkService: NewsNetworkServiceProtocol) {
        self.newsNetworkService = newsNetworkService
    }
    
    func fetchNews(completion: @escaping (Result<MainNewsEntity, NetworkServiceErrors>) -> Void) {
        Task {
            await newsNetworkService.getNews { result in
                switch result {
                case .success(let newsData):
                    completion(.success(newsData))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
    }
}
