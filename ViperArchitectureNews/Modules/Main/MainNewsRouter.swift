//
//  MainNewsRouter.swift
//  ViperArchitectureNews
//
//  Created by Cesar Humberto Grifaldo Garcia on 26/09/23.
//

import UIKit

final class MainNewsRouter {
    
    func showMainNewsScreen(window: UIWindow?) {
        let newNetworkService: NewsNetworkServiceProtocol = NewsNetworkService()
        let interactor = MainNewsInteractor(newsNetworkService: newNetworkService)
        let presenter = MainNewsPresenter(mainNewsInteractor: interactor,
                                          mapper: NewsViewModelMapper())
        let view = MainNewsViewController(presenter: presenter)
        
        presenter.view = view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
