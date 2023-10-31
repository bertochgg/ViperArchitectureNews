//
//  NewsViewModelMapper.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import Foundation

final class NewsViewModelMapper {
    func map(entity: Article) -> NewsViewModel {
        .init(author: entity.author ?? "",
              title: entity.title,
              description: entity.description,
              content: entity.content,
              image: URL(string: entity.urlToImage ?? ""))
    }
}
