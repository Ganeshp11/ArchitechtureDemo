//
//  LoadMoreTableViewCell.swift
//  Dewing Grain
//
//  Created by Pooja Aher on 01/07/20.
//  Copyright © 2020 amarsingh. All rights reserved.
//

import UIKit

class LoadMoreTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var loadMoreLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    
        // MARK: - View Life Cycle
    override func awakeFromNib()  {
        super.awakeFromNib()
        loadMoreLabel.textColor = Theme.Color.lightTextColor
        loadMoreLabel.font = Theme.Font.getFont(FontName.Regular, .FontSize14)
        activityIndicator.color = Theme.Color.primaryTextColor
        if #available(iOS 13.0, *) {
            activityIndicator.style = .medium
        } else {
            activityIndicator.style = .gray
        }
    }

    
}
