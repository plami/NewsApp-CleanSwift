//
//  NewsPresenter.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

class NewsPresenter: NewsPresentationLogic {
    
    private(set) weak var controller: NewsDisplayLogic?
    
    init(output: NewsDisplayLogic) {
        controller = output
    }
    
    func presentArticles(articles: [Article]) {
        controller?.displayNews(articles: articles)
    }
    
    func presentError(error: NSError) {
        controller?.displayNewsFailure(error: error)
    }
}

// MARK: - Clean Swift Protocols

protocol NewsPresentationLogic {
    
    func presentArticles(articles: [Article])
    func presentError(error: NSError)
}
