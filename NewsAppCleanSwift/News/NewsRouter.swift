//
//  NewsRouter.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation

class NewsRouter: NewsRouterLogic {
    
    private(set) weak var controller: NewsDisplayLogic?
    
    init(viewController: NewsDisplayLogic) {
        controller = viewController
    }
}

// MARK: - Clean Swift Protocols

protocol NewsRouterLogic {
    
}
