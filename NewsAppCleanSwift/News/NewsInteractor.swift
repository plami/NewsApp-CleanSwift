//
//  NewsInteractor.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

class NewsInteractor: NewsBusinessLogic {
    
    private let presenter: NewsPresentationLogic!
    private let worker = NewsWorker()
    
    init(output: NewsPresentationLogic) {
        presenter = output
    }
    
    func fetchNews() {
        worker.loadTopHeadlines(completionHandler: { [weak self] articlesResult in
            switch articlesResult {
            case .success(let articles):
                self?.presenter.presentArticles(articles: articles)
            case .failure(let error):
                self?.presenter.presentError(error: error as NSError)
            }
        }) { [weak self] error in
            switch error {
            case .success(let error):
                self?.presenter.presentError(error: error as NSError)
            case .failure(let error):
                self?.presenter.presentError(error: error as NSError)
            }
        }
    }
}

// MARK: - Clean Swift Protocols

protocol NewsBusinessLogic {
    func fetchNews()
}
