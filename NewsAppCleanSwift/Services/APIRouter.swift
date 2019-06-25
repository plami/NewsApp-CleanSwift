//
//  APIRouter.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

enum APIRouter {
    
    case newsArticles
    
    private var baseURL: String {
        return "https://newsapi.org/v2/"
    }
    
    private var path: String {
        switch self {
        case .newsArticles:
            return "top-headlines?country=us&apiKey=f17d8c27fac24c85bad1aa27e4bf16fe"
        @unknown default:
            print("All other cases")
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .newsArticles:
            return .get
        @unknown default:
            print("All other cases")
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL) else { throw AppError.wrongURL }
        let wholeURL = url.appendingPathComponent(path)
        guard let encodedURL = URL(string: wholeURL.absoluteString.removingPercentEncoding!) else { throw AppError.wrongURL }
        
        var request = URLRequest(url: encodedURL)
        request.httpMethod = method.rawValue
        
        return request
    }
}

enum AppError: Error {
    case wrongURL
}

enum HTTPMethod: String {
    case get = "GET"
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
