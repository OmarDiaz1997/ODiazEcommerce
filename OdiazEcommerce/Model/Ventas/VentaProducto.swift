import Foundation
struct VentaProductoCarrito{
    var IdVentaProducto : Int
    var Cantidad : Int
    //Propiedades de navegacion
    var Producto : Producto?
    
    init(IdVentaProducto: Int, Cantidad: Int, Producto: Producto? = nil) {
        self.IdVentaProducto = IdVentaProducto
        self.Cantidad = Cantidad
        self.Producto = Producto
    }
    
    init(){
        self.IdVentaProducto = 0
        self.Cantidad = 0
        self.Producto = nil
    }
}
