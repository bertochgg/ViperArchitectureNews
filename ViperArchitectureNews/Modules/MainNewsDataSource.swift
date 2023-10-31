//
//  MainNewsDataSource.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import UIKit

protocol MainNewsDataSourceProtocol: AnyObject, UITableViewDataSource {
    func updateData(viewModels: [NewsViewModel])
}

final class MainNewsDataSource: NSObject, MainNewsDataSourceProtocol {
    private var newsViewModels: [NewsViewModel] = []
    
    func updateData(viewModels: [NewsViewModel]) {
        self.newsViewModels = viewModels
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as? NewsViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(viewModel: newsViewModels[indexPath.row])
        
        return cell
    }
    
    
}
