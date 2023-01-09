//
//  Usuario.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 06/01/23.
//

import Foundation
struct Usuario {
    var UserName :String
    var Nombre : String
    var ApellidoPaterno : String
    var ApellidoMaterno : String
    var Email : String
    var Password : String
    var FechaNacimiento : Date
    var Sexo : String
    var Telefono : String
    var Celular : String
    var CURP : String
    var Imagen : String
    
    init(UserName: String, Nombre: String, ApellidoPaterno: String, ApellidoMaterno: String, Email: String, Password: String, FechaNacimiento: Date, Sexo: String, Telefono: String, Celular: String, CURP: String, Imagen: String) {
        self.UserName = UserName
        self.Nombre = Nombre
        self.ApellidoPaterno = ApellidoPaterno
        self.ApellidoMaterno = ApellidoMaterno
        self.Email = Email
        self.Password = Password
        self.FechaNacimiento = FechaNacimiento
        self.Sexo = Sexo
        self.Telefono = Telefono
        self.Celular = Celular
        self.CURP = CURP
        self.Imagen = Imagen
    }
    
    init() {
        self.UserName = ""
        self.Nombre = ""
        self.ApellidoPaterno = ""
        self.ApellidoMaterno = ""
        self.Email = ""
        self.Password = ""
        self.FechaNacimiento = Date()
        self.Sexo = ""
        self.Telefono = ""
        self.Celular = ""
        self.CURP = ""
        self.Imagen = ""
    }
}