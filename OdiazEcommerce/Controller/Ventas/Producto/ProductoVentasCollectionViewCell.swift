//
//  ProductoVentasCollectionViewCell.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 13/01/23.
//

import UIKit

class ProductoVentasCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ProductoImageView: UIImageView!
    @IBOutlet weak var NombreText: UILabel!
    @IBOutlet weak var PrecioUnitarioText: UILabel!
    @IBOutlet weak var StockText: UILabel!
    @IBOutlet weak var ProveedorText: UILabel!
    @IBOutlet weak var DescripcionText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
