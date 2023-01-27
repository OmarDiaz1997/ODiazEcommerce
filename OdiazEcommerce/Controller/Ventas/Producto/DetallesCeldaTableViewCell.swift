//
//  DetallesCeldaTableViewCell.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 25/01/23.
//

import UIKit

class DetallesCeldaTableViewCell: UITableViewCell {
    @IBOutlet weak var NombreLabel: UILabel!
    @IBOutlet weak var PrecioLabel: UILabel!
    @IBOutlet weak var StockLabel: UILabel!
    @IBOutlet weak var ProveedorLabel: UILabel!
    @IBOutlet weak var DepartamentoLabel: UILabel!
    @IBOutlet weak var DescripcionText: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
