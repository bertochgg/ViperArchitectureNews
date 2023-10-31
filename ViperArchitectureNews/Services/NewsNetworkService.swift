//
//  NewsNetworkService.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

protocol NewsNetworkServiceProtocol: AnyObject {
    func getNews(completion: @escaping (Result<MainNewsEntity, NetworkServiceErrors>) -> Void) async
}

final class NewsNetworkService: NewsNetworkServiceProtocol {
    func getNews(completion: @escaping (Result<MainNewsEntity, NetworkServiceErrors>) -> Void) async {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=\(Constants.apiKey)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let newsData = try jsonDecoder.decode(MainNewsEntity.self, from: data)
                completion(.success(newsData))
            } catch {
                if let urlError = error as? URLError {
                    completion(.failure(.networkError(urlError)))
                } else {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
//    private func parseJSON(json: Any, completion: @escaping (Result<MainNewsEntity, NetworkServiceErrors>) -> Void) {
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: json)
//            let decoder = JSONDecoder()
//            let newsData = try decoder.decode(MainNewsEntity.self, from: jsonData)
//            completion(.success(newsData))
//        } catch let error {
//            completion(.failure(NetworkServiceErrors.decodingError(error)))
//            print(error.localizedDescription)
//        }
//    }
}

