//
//  TableViewCell.swift
//  ArchitechtureDemo
//
//  Created by Neosoft on 09/03/22.
//

import UIKit
import SDWebImage
class TableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var starImages: [UIImageView]!
    
    static let bgColor = UIColor(hexString: "#FFFFFF")
    static let titleTextColor = UIColor(hexString: "#4F4F4F")
    static let priceColor = UIColor(hexString: "#FE4040")
    static let shadColor = UIColor(hexString: "#EDEDED")
//    static let bgColor = UIColor(hexString: "#ffffff")
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.backgroundColor = TableViewCell.bgColor
        titleLabel.textColor = TableViewCell.titleTextColor
        titleLabel.font = Theme.Font.getFont(FontName.Medium, .FontSize45)
        DescriptionLabel.textColor = TableViewCell.titleTextColor
        DescriptionLabel.font = Theme.Font.getFont(FontName.Regular, .FontSize30)
        priceLabel.textColor = TableViewCell.priceColor
        priceLabel.font = Theme.Font.getFont(FontName.Medium, .FontSize60)
        imgView.dropShadow(color: TableViewCell.shadColor)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setListingData(listDataRow: ListData){
            
        titleLabel.text = listDataRow.name
        DescriptionLabel.text = listDataRow.producer
            let imgStr = listDataRow.productImages ?? ""
            let imageThumbnail = URL(string: imgStr)
        imgView.sd_setImage(with: imageThumbnail, placeholderImage: UIImage(named: "ImagePlaceholder"), options: .highPriority)
    //
    //        newsImage.sd_setImage(with: imageThumbnail, placeholderImage: UIImage(named: "ImagePlaceholder"), options: .highPriority )
    //
            //newsImage.sd_setImage(with: imageThumbnail, placeholderImage: UIImage(named: "ImagePlaceholder"), options: .highPriority)
            
    //        imgURL = newsDataRow.image ?? ""
    //        newsImage.image = UIImage(named: newsDataRow.image ?? "")
        
    }
    
}
