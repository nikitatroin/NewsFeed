//
//  NewsViewController.swift
//  NewFeed
//
//  Created by Никита Троян on 16.12.2021.
//

import UIKit
import PromiseKit

final class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let getDataService = NewsService()
    var newsItemsContainer: [NewsItems] = []
    var groupsContainer: [Group] = []
    var profilesContainer: [Profile] = []
    var rowModels = [NewCellViewModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        self.tableView.register(UINib(nibName: "infoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        self.tableView.register(UINib(nibName: "textCell", bundle: nil), forCellReuseIdentifier: "textCell")
        
        when(fulfilled: getDataService.getItems(), getDataService.getProfiles(), getDataService.getGroups())
            .tap{ result in
                debugPrint(result)
            }.done{ [weak self] result1, result2, result3 in
                guard let self = self else {return}
                self.newsItemsContainer = result1
                self.profilesContainer = result2
                self.groupsContainer = result3
                self.rowModels = self.buildViewModels(news: self.newsItemsContainer, groups: self.groupsContainer, profiles: self.profilesContainer)
                self.tableView.reloadData()
            }
        
        
    }
    
    private func buildViewModels(news: [NewsItems], groups: [Group], profiles: [Profile]) -> [NewCellViewModel] {
        var rowModels = [NewCellViewModel]()
        for news in news {
            for group in groups {
                for profile in profiles {
                    let url = URL(string: profile.photo100)!
                    let data = try! Data(contentsOf: url)
                    let image = UIImage(data: data )
                    let model = NewCellViewModel(text: news.text, photo: image, name: profile.firstName, date: Double.getRelativeDateStringFromUTC(Double(news.date))())
                    rowModels.append(model)
                }
            }
        }
        return rowModels
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rowModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.setup(viewModel: rowModels[indexPath.row])
        return cell
        
        
    }
}

extension NewsViewController: UITableViewDelegate {
    
}
