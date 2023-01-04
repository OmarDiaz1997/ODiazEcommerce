//
//  ProductoTableViewCell.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 30/12/22.
//

import UIKit

class ProductoTableViewCell: UITableViewCell {
    @IBOutlet weak var IdProductolbl: UILabel!
    @IBOutlet weak var NombreField: UILabel!
    @IBOutlet weak var PrecioUnitarioField: UILabel!
    @IBOutlet weak var StockField: UILabel!
    @IBOutlet weak var ProveedorField: UILabel!
    @IBOutlet weak var DepartamentoField: UILabel!
    @IBOutlet weak var DescripcionField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 470
        
    }
    
}
