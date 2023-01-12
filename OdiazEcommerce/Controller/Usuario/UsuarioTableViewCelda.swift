//
//  UsuarioTableViewCelda.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 10/01/23.
//

import UIKit
import SwipeCellKit

class UsuarioTableViewCelda: SwipeTableViewCell {

    @IBOutlet weak var UserNameCell: UILabel!
    @IBOutlet weak var NombreCell: UILabel!
    @IBOutlet weak var ApellidoPaternoCell: UILabel!
    @IBOutlet weak var ApellidoMaternoCell: UILabel!
    @IBOutlet weak var EmailCell: UILabel!
    @IBOutlet weak var PasswordCell: UILabel!
    @IBOutlet weak var FechaNacimientoCell: UILabel!
    @IBOutlet weak var SexoCell: UILabel!
    @IBOutlet weak var TelefonoCell: UILabel!
    @IBOutlet weak var CelularCell: UILabel!
    @IBOutlet weak var CURPCell: UILabel!
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
