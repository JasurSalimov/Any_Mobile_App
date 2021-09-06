//
//  PopupTableViewCell.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/28/21.
//

import UIKit

class PopupTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        appearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func appearance(){
        mainLabel.font = R.font.gilroyBold(size: 17)
        secondaryLabel.font = R.font.gilroyBold(size: 13)
        distanceLabel.font = R.font.gilroyBold(size: 13)
        mainLabel.textColor = R.color.customGrey()
        secondaryLabel.textColor = R.color.customGrey()
        distanceLabel.textColor = R.color.customGrey()
        
    }
    
}
