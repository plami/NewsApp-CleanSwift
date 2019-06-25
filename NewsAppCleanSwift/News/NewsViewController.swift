//
//  ViewController.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 24.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsDataSource: DataSourceAdapter!
    
    // MARK: Clean Swift properties
    
    var interactor: NewsBusinessLogic!
    var router: NewsRouterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        interactor.fetchNews()
    }
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // MARK: - Setup
    
    func configure() {
        NewsConfigurator.shared.config(viewController: self)
    }
}

private extension NewsViewController {
    
    func setUpTableView() {
        newsDataSource = DataSourceAdapter(cellReuseIdentifier: "NewsTableViewCell")
        
        newsDataSource.delegate = self
        
        tableView.dataSource = newsDataSource
        tableView.delegate = newsDataSource
    }
}

extension NewsViewController: NewsDisplayLogic, DataSourceAdapterDelegate {
    func populateNews(articles: [Article]) {
        self.newsDataSource.injectData(articleList: articles)
        self.newsDataSource.setItems(numberOfItemsInSection: (articles.count))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayNews(articles: [Article]) {
        populateNews(articles: articles)
    }
    
    func displayNewsFailure(error: NSError) {
        self.showAlert(withTitle: "", message: error.localizedDescription, buttonTitle: "OK", preferredStyle: .alert, completion: nil)
    }
}

// MARK: - Clean Swift Protocols

protocol NewsDisplayLogic: class {
    func displayNews(articles: [Article])
    func displayNewsFailure(error: NSError)
}

