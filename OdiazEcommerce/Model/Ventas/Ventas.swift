import Foundation

struct Ventas{
    var IdVenta : Int
    var Total : Double
    var Fecha : Date
    var Usuario : Usuario?
    var MetodoPagos : MetodoPagos?
    
    init(IdVenta: Int, Total: Double, Fecha: Date, Usuario: Usuario? = nil, MetodoPagos: MetodoPagos? = nil) {
        self.IdVenta = IdVenta
        self.Total = Total
        self.Fecha = Fecha
        self.Usuario = Usuario
        self.MetodoPagos = MetodoPagos
    }
    
    init(){
        self.IdVenta = 0
        self.Total = 0.0
        self.Fecha = Date.now
        self.Usuario = nil
        self.MetodoPagos = nil
    }
}
