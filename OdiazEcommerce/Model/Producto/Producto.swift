//
//  Producto.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 28/12/22.
//

import Foundation
struct Producto {
    var IdProducto : Int
    var Nombre : String
    var PrecioUnitario : Double
    var Stock : Int
    var Descripcion : String
    var Imagen : String
    //Propiedades de navegación
    var Proveedor : Proveedor?
    var Departamento : Departamento?
    
    init(IdProducto: Int, Nombre: String, PrecioUnitario: Double, Stock: Int, Descripcion: String, Imagen : String, Proveedor: Proveedor, Departamento: Departamento) {
        self.IdProducto = IdProducto
        self.Nombre = Nombre
        self.PrecioUnitario = PrecioUnitario
        self.Stock = Stock
        self.Descripcion = Descripcion
        self.Imagen = Imagen
        self.Proveedor = Proveedor
        self.Departamento = Departamento
    }
    
    init(){
        self.IdProducto = 0
        self.Nombre = ""
        self.PrecioUnitario = 0.0
        self.Stock = 0
        self.Descripcion = ""
        self.Imagen = ""
        //Propiedades de navegación
        self.Proveedor = nil
        self.Departamento = nil
    }
}
