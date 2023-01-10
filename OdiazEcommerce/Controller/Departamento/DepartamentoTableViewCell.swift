//
//  DepartamentoTableViewCell.swift
//  OdiazEcommerce
//
//  Created by Omar Diaz on 08/01/23.
//

import UIKit
import SwipeCellKit

class DepartamentoTableViewCell: SwipeTableViewCell {
    
    @IBOutlet weak var IdDepartamentoCell: UILabel!
    @IBOutlet weak var NombreCell: UILabel!
    @IBOutlet weak var AreaCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
