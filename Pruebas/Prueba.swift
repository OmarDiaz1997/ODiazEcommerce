import UIKit

class Prueba: UIViewController {
    let ventaProductoCarrito = VentaProductoCar()
    var ventas = [VentaProductoCarrito]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Agregar()
    }
    func Agregar(){
        let result = ventaProductoCarrito.Add(carrito: VentaProductoCarrito(IdVentaProducto: 0, Cantidad: 5), id: 1)
        if result.Correct{
            print("Se agrego el registro correctamente")
            ////ventas = result.Objects! as! [Area]
        }
        
    }
}
