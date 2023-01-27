import UIKit

class VentasViewController: UIViewController {
    
    @IBOutlet weak var CarritoTableView: UITableView!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var ComprarButton: UIButton!
    
    let carritoViewModel = VentaProductoCar()
    var carrito = [VentaProductoCarrito]()
    
    /*var idUsuario : Int? = nil
    let metodoPagoViewModel = MetodoPagoViewModel()
    var metodoPagoModel : MetodoPagos? = nil*/

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //insert()
        //GetByID()
        
    }
    

    
}
















/*func insert (){
    metodoPagoModel = MetodoPagos(IdMetodoPago: 0, Metodo: "06 Transferencias bancarias electronicas")
    let result = metodoPagoViewModel.Add(metodoPagos: metodoPagoModel!)
    
    //let result = usuarioViewModel.Add(usuario: usuarioModel!)
    
    if result.Correct == true{
        print("Se agrego el metodo")

    }
}
let id : Int = 1
func GetByID(){
    //metodoPagoModel = MetodoPagos(IdMetodoPago: id, Metodo: "")
    let result = metodoPagoViewModel.GetById(IdMetodoPago: id)
    print(result)
}*/
