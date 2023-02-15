//
//  TitleCell.swift
//  Swift MVC
//
//  Created by Kan Hein on 15/02/2023.
//

import UIKit

class TitleCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
