//
//  NewsConfigurator.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

class NewsConfigurator {
    
    // MARK: - Singleton
    
    static var shared = NewsConfigurator()
    private init() { }
    
    func config(viewController: NewsViewController) {
        let presenter = NewsPresenter(output: viewController)
        let router = NewsRouter(viewController: viewController)
        let interactor = NewsInteractor(output: presenter)
        viewController.interactor = interactor
        viewController.router = router
    }
}
