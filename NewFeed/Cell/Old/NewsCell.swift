//
//  NewsCell.swift
//  NewFeed
//
//  Created by Никита Троян on 17.12.2021.
//

import UIKit


class NewsCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var newsText: UITextView!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(viewModel: NewCellViewModel) {
        self.postDate.text = viewModel.date
        self.newsText.text = viewModel.text
        self.profileName.text = viewModel.name
        self.profileImage.image = viewModel.photo
    }

}


