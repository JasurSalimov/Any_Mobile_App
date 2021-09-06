//
//  SmallTableViewCell.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//

import UIKit
import Rswift
class SmallTableViewCell: UITableViewCell {

    
    @IBOutlet weak var smallCellView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var secondaryAddress: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageOutlet.image = R.image.fav_Icon()
        smallCellView.layer.cornerRadius = 13
        // Initialization code
        addressLabel.font = Constants.mainFont
        secondaryAddress.font = Constants.secondaryFont
      
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
