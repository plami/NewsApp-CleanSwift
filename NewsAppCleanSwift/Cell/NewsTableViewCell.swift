//
//  NewsTableViewCell.swift
//  NewsAppCleanSwift
//
//  Created by Plamena Nikolova on 25.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension NewsTableViewCell: ArticleConfigurable {
    func configure(with article: Article) {
        self.textLabel?.text = article.title
        self.detailTextLabel?.text = article.description
    }
}
