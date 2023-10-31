//
//  NetworkServiceErrors.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

enum NetworkServiceErrors: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .networkError(let error):
            return "\(error) detected"
        case.decodingError(let error):
            return "\(error) detected"
        }
    }
}
