//
//  MainNewsViewController.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import UIKit

final class MainNewsViewController: UIViewController {
    private let presenter: MainNewsPresenterProtocol
    private let dataSource: MainNewsDataSourceProtocol = MainNewsDataSource()
    
    lazy private var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = 320
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(NewsViewCell.self, forCellReuseIdentifier: NewsViewCell.identifier)
        return tableView
    }()
    
    init(presenter: MainNewsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.prepareNews()
        setupTableView()
    }
    
    private func setupTableView() {
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newsTableView)
        
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        newsTableView.dataSource = dataSource

    }
}

extension MainNewsViewController: MainNewsPresenterDelegate {
    func updateUI(viewModels: [NewsViewModel]) {
        DispatchQueue.main.async {
            print(viewModels)
            self.dataSource.updateData(viewModels: viewModels)
            self.newsTableView.reloadData()
        }
    }
}
