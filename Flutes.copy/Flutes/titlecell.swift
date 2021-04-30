//
//  titlecell.swift
//  Flutes
//
//  Created by ahmed aelsebaay on 29/04/2021.
//

import UIKit

class titlecell: UITableViewCell {

    
    @IBOutlet weak var songtitle: UILabel!
   
    @IBOutlet weak var songerrName: UILabel!
    
    @IBOutlet weak var sonngerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.sonngerImage.layer.cornerRadius = 50
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
