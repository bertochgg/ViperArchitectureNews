//
//  MainNewsEntity.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

struct MainNewsEntity: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]

}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String?
    let content: String
}
