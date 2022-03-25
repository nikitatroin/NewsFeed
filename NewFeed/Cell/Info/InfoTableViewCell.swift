//
//  InfoTableViewCell.swift
//  NewFeed
//
//  Created by Никита Троян on 24.12.2021.
//

import UIKit
import Alamofire

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userGroupName: UILabel!
    @IBOutlet weak var userGroupImage: RoundedImageView!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.userGroupImage.image = nil
    }
    
    func configure(profile: Profile? = nil, group: Group? = nil, date: Double){
        if let profile = profile {
            self.userGroupName.text = "\(profile.firstName ?? "") \(profile.lastName)"
            AF.request(profile.photo100, method: .get).response { response in
                if let data = response.value {
                    let image = UIImage(data: data ?? Data())
                    self.userGroupImage.image = image
                } else {
                    self.userGroupImage.image = UIImage(named: "defaultimage")
                }
            }
        } else {
            if let group = group {
                userGroupName.text = group.name
                AF.request(group.photo100, method: .get).response { response in
                    if let data = response.value {
                        let image = UIImage(data: data ?? Data())
                        self.userGroupImage.image = image
                    } else {
                        self.userGroupImage.image = UIImage(named: "defaultimage")
                    }
                }
                self.date.text = date.getDateStringFromUTC()
            }
        }
    }
}
