//
//  PhotoTableViewCell.swift
//  NewFeed
//
//  Created by Никита Троян on 26.12.2021.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var colletionView: UICollectionView!
    
    var images:[UIImage] = [] {
        didSet {
            self.colletionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colletionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionCell")
    }
    
}

extension PhotoTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = colletionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? CollectionViewCell {
            cell.itemImage.image = images[indexPath.row]
            return cell
        }
        return CollectionViewCell()
    }
    
    
}
