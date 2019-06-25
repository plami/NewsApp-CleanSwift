//
//  NewsWorker.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

typealias OnSuccessCompletionHandlerArticle = (Result<[Article]>) -> ()
typealias OnErrorHandler = (Result<NSError>) -> ()

class NewsWorker {
    
    func loadTopHeadlines(completionHandler: @escaping OnSuccessCompletionHandlerArticle,
                          onErrorHandler: @escaping OnErrorHandler) {
        
        if let url = try? APIRouter.newsArticles.asURLRequest() {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    return onErrorHandler(.failure(error))
                }
                
                guard let data = data, error == nil else {
                    return
                }
                
                let response = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let response = response {
                    DispatchQueue.main.async {
                        completionHandler(.success(response.articles))
                    }
                }
            }.resume()
        }
    }
}

