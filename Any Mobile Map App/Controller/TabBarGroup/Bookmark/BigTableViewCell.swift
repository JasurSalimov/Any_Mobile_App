//
//  BigTableViewCell.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//

import UIKit

class BigTableViewCell: UITableViewCell {
    @IBOutlet weak var bigCellView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var favIconOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingImage.image = R.image.rating()
        favIconOutlet.image = R.image.fav_Icon()
        bigCellView.layer.cornerRadius = 13
        mainLabel.font = Constants.mainFont
        secondaryLabel.font = Constants.secondaryFont
        timeLabel.font = Constants.secondaryFont
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
