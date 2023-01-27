import Foundation

struct MetodoPagos{
    var IdMetodoPago : Int
    var Metodo : String
    
    init(IdMetodoPago: Int, Metodo: String) {
        self.IdMetodoPago = IdMetodoPago
        self.Metodo = Metodo
    }
    
    init(){
        self.IdMetodoPago = 0
        self.Metodo = ""
    }
}
