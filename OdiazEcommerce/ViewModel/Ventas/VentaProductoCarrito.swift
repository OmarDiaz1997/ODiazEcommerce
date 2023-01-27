import Foundation
import UIKit
import CoreData

class VentaProductoCar{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var idProducto : Int? = nil
    let prductoViewModel = ProductoViewModel()
    var productoModel : Producto? = nil
    
    func GetByProducto(idProducto : Int){
        let result = prductoViewModel.GetById(IdProducto: Int32(idProducto))
        print(result)
    }
    
    
    func Add(carrito : VentaProductoCarrito, id : Int) -> Result{
        /*let resultado = GetByIdProducto(id: id)
        if resultado.Correct{
            //Incremento de cantidad
        }else{}*/
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "ventaProducto", in: context)
            let carritoCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            carritoCoreData.setValue(carrito.Cantidad, forKey: "cantidad")
            carritoCoreData.setValue(id, forKey: "idProducto")
            
            try! context.save()
            result.Correct = true
            
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    func GetByIdProducto(id : Int) -> Result{
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "VentaProducto")
            let carrito = try context.fetch(request) as! [NSManagedObject]
            
            let car = VentaProductoCarrito(IdVentaProducto: id, Cantidad: 0)
            
            result.Object = car
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        
        return result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func Update(carrito : VentaProductoCarrito, idVenta : Int) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "VentaProducto")
            let carritoCoreData = try context.fetch(request) as! [NSManagedObject]
            
            carritoCoreData[idVenta].setValue(carrito.Cantidad, forKey: "cantidad")
            
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    func GetAll() -> Result{
        var result = Result()
        
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "VentaProducto")
            let carritoCoreData = try context.fetch(request) as! [NSManagedObject]
            
            result.Objects = []
            for producto in carritoCoreData{
                let protductos = VentaProductoCarrito(IdVentaProducto: Int(producto.objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!,
                                                      Cantidad: producto.value(forKey: "cantidad") as! Int)
                result.Objects?.append(protductos)
            }
            result.Correct = true
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
}
