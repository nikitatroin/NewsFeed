//
//  TextTableViewCell.swift
//  NewFeed
//
//  Created by Никита Троян on 26.12.2021.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    @IBOutlet weak var feedText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure (text: NewsItems?){
        guard let text = text else {return}
        self.feedText.text = text.text
    }
}
