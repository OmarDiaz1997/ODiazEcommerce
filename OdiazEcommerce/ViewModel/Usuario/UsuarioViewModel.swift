//
//  UsuarioViewModel.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 09/01/23.
//

import CoreData
import UIKit

class UsuarioViewModel{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func Add(usuario : Usuario) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
            let usuarioCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            usuarioCoreData.setValue(usuario.UserName, forKey: "userName")
            usuarioCoreData.setValue(usuario.Nombre, forKey: "nombre")
            usuarioCoreData.setValue(usuario.ApellidoPaterno, forKey: "apellidoPaterno")
            usuarioCoreData.setValue(usuario.ApellidoMaterno, forKey: "apellidoMaterno")
            usuarioCoreData.setValue(usuario.Email, forKey: "email")
            usuarioCoreData.setValue(usuario.Password, forKey: "password")
            usuarioCoreData.setValue(usuario.FechaNacimiento, forKey: "fechaNacimiento")
            usuarioCoreData.setValue(usuario.Sexo, forKey: "sexo")
            usuarioCoreData.setValue(usuario.Telefono, forKey: "telefono")
            usuarioCoreData.setValue(usuario.Celular, forKey: "celular")
            usuarioCoreData.setValue(usuario.CURP, forKey: "curp")
            usuarioCoreData.setValue(usuario.Imagen, forKey: "imagen")
            
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetAll() -> Result {
        var result = Result()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        do {
            let usuarios = try context.fetch(request)
            result.Objects = [Usuario]()
            for objUsuario in usuarios as! [NSManagedObject] {
                var usuario = Usuario()
                //usuario.IdUsuario =  objUsuario.objectID.uriRepresentation().absoluteString
                usuario.UserName = objUsuario.value(forKey: "userName") as! String
                usuario.Nombre = objUsuario.value(forKey: "nombre") as! String
                usuario.ApellidoPaterno = objUsuario.value(forKey: "apellidoPaterno") as! String
                usuario.ApellidoMaterno = objUsuario.value(forKey: "apellidoMaterno") as! String
                usuario.Email = objUsuario.value(forKey: "email") as! String
                usuario.Password = objUsuario.value(forKey: "password") as! String
                //usuario.FechaNacimiento = objUsuario.value(forKey: "fechaNacimiento") as! String
                usuario.Sexo = objUsuario.value(forKey: "sexo") as! String
                usuario.Telefono = objUsuario.value(forKey: "telefono") as! String
                usuario.Celular = objUsuario.value(forKey: "celular") as! String
                usuario.CURP = objUsuario.value(forKey: "curp") as! String
                usuario.Imagen = objUsuario.value(forKey: "imagen") as! String
                
                result.Objects?.append(usuario)
            }
            result.Correct = true
        } catch let error {
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    
    func Delete(idUsuario : Int) -> Result{
        //Para eliminar se necesita todo el modelo de usuario
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
            let usuarioCoreData = try context.fetch(entidad) as! [NSManagedObject]
            
         
            //usuarioCoreData.setValue(usuario.UserName, forKey: "userName")
            context.delete(usuarioCoreData[Int(usuarioCoreData[idUsuario].objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!])
            
            try context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    /*func Delete(IdUsuario: Int,Nombre: String,Apaterno: String, Email: String, Password: String) -> Result{
        var result = Result()
        let usuarioform = Usuario()
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
        let request: NSFetchRequest<Usuario>=Usuario.fetchRequest()
        request.entity = entity
        
        let predicate = NSPredicate(format: "Self = \(IdUsuario)")
        request.predicate = predicate
        
        do{
            var result = try! context.fetch(request)
            if result.count > 0 {
                let usuario = result[0] as! NSManagedObject
                context.delete(usuario)
                /* usuario.setValue(Nombre, forKey: "nombre")
                 usuario.setValue(Apaterno, forKey: "apellidoPaterno")
                 usuario.setValue(Email, forKey: "email")
                 usuario.setValue(Password, forKey: "password")*/
                try! context.save()
                print("Usuario Eliminado")
                
                
                
            }
        }*/
    
    
    
    func Update(usuario : Usuario, idUsuario : Int) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
            let usuarioCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            usuarioCoreData.setValue(usuario.UserName, forKey: "userName")
            usuarioCoreData.setValue(usuario.Nombre, forKey: "nombre")
            usuarioCoreData.setValue(usuario.ApellidoPaterno, forKey: "apellidoPaterno")
            usuarioCoreData.setValue(usuario.ApellidoMaterno, forKey: "apellidoMaterno")
            usuarioCoreData.setValue(usuario.Email, forKey: "email")
            usuarioCoreData.setValue(usuario.Password, forKey: "password")
            usuarioCoreData.setValue(usuario.FechaNacimiento, forKey: "fechaNacimiento")
            usuarioCoreData.setValue(usuario.Sexo, forKey: "sexo")
            usuarioCoreData.setValue(usuario.Telefono, forKey: "telefono")
            usuarioCoreData.setValue(usuario.Celular, forKey: "celular")
            usuarioCoreData.setValue(usuario.CURP, forKey: "curp")
            
            //context.updatedObjects(usuarioCoreData[idUsuario])
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    
    func GetById(idUsuario : Int)-> Result{
        var result = Result()
        
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
            let usuarioCoreData = try context.fetch(entidad) as! [NSManagedObject]
            
            let usuario = Usuario(
                IdUsuario: Int(usuarioCoreData[idUsuario].objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!,
                UserName: usuarioCoreData[idUsuario].value(forKey: "userName") as! String,
                Nombre: usuarioCoreData[idUsuario].value(forKey: "nombre") as! String,
                ApellidoPaterno: usuarioCoreData[idUsuario].value(forKey: "apellidoPaterno") as! String,
                ApellidoMaterno: usuarioCoreData[idUsuario].value(forKey: "apellidoMaterno") as! String,
                Email: usuarioCoreData[idUsuario].value(forKey: "email") as! String,
                Password: usuarioCoreData[idUsuario].value(forKey: "password") as! String,
                FechaNacimiento: usuarioCoreData[idUsuario].value(forKey: "fechaNacimiento") as! Date,
                Sexo: usuarioCoreData[idUsuario].value(forKey: "sexo") as! String,
                Telefono: usuarioCoreData[idUsuario].value(forKey: "telefono") as! String,
                Celular: usuarioCoreData[idUsuario].value(forKey: "celular") as! String,
                CURP: usuarioCoreData[idUsuario].value(forKey: "curp") as! String,
                Imagen: usuarioCoreData[idUsuario].value(forKey: "imagen") as! String)
            
            //usuarioCoreData.setValue(usuario.UserName, forKey: "userName")
            //context.delete(usuarioCoreData[idUsuario])
            
            result.Object = usuario
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        
        return result
    }
    
}
