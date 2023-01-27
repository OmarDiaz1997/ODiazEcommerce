//
//  CarritoTableViewCell.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 25/01/23.
//

import UIKit

class CarritoTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageCarrito: UIImageView!
    @IBOutlet weak var NombreCarrito: UILabel!
    @IBOutlet weak var PrecioCarrito: UILabel!
    @IBOutlet weak var CantidadCarrito: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
