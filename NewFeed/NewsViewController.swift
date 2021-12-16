//
//  NewsViewController.swift
//  NewFeed
//
//  Created by Никита Троян on 16.12.2021.
//

import UIKit
import PromiseKit

final class NewsViewController: UIViewController {
    
    let getDataService = NewsService()
    var itemsContainer: [NewsItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstly{
            getDataService.getItems()
        }.tap{ result in
            //debugPrint(result)
        }.done{
            self.itemsContainer = $0
            //self.collectionView.reloadData()
        }
    }
    
}
