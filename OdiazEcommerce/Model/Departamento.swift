//
//  Departamento.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 28/12/22.
//

import Foundation
struct Departamento {
    var IdDepartamento : Int
    var Nombre : String
    //Propiedades de navegación
    var area : Area?
    
    
    init(IdDepartamento: Int, Nombre: String) {
        self.IdDepartamento = IdDepartamento
        self.Nombre = Nombre
        //self.area = area
    }
    
    
    init() {
        self.IdDepartamento = 0
        self.Nombre = ""
        self.area = nil
    }
}
