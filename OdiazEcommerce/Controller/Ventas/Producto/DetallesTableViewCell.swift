import UIKit

class DetallesTableViewCell: UITableViewCell {
    @IBOutlet weak var NombreTextField: UILabel!
    @IBOutlet weak var PrecioTextField: UILabel!
    @IBOutlet weak var StockTextField: UILabel!
    @IBOutlet weak var ProveedorTextField: UILabel!
    @IBOutlet weak var DepartamentoTextField: UILabel!
    @IBOutlet weak var DescripcionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
