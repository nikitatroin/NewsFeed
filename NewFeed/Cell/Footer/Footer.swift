//
//  Footer.swift
//  NewFeed
//
//  Created by Никита Троян on 26.12.2021.
//

import UIKit

class FeedItemFooter: UITableViewHeaderFooterView {
    
    var likes = UILabel()
    var views = UILabel()
    var stackView = UIStackView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        
        likes.font = UIFont.preferredFont(forTextStyle: .footnote)
        likes.textColor = UIColor.secondaryLabel
        views.font = UIFont.preferredFont(forTextStyle: .body)
        views.textColor = UIColor.secondaryLabel
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 20
        
        stackView.insertArrangedSubview(views, at: 0)
        stackView.insertArrangedSubview(likes, at: 1)
        
        contentView.addSubview(stackView)

        
        NSLayoutConstraint.activate([
            
            stackView.heightAnchor.constraint(equalToConstant: 50),
            stackView.leadingAnchor.constraint(equalTo:  contentView.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo:  contentView.centerYAnchor),
        ])
    }
}
