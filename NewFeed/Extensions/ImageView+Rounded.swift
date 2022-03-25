//
//  ImageView+Rounded.swift
//  NewFeed
//
//  Created by Никита Троян on 24.12.2021.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2
    }
}
