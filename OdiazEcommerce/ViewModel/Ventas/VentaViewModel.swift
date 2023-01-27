import Foundation
import UIKit
import CoreData
import SQLite3

class Sales{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let Sales : Ventas? = nil
    
    /*---------  ADD   --------*/
    func Add(venta : Ventas) -> Result{
                
        var result = Result()
        let context = DB.init()
        let query = "INSERT INTO Venta(Total, Fecha, IdUsuario,IdMetodoPago)VALUES (?,?,?,?)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_double(statement, 1, Double(venta.Total))
                //sqlite3_bind_(statement, 2, Date(venta.Fecha))
                
                if sqlite3_step(statement) == SQLITE_DONE{
                    result.Correct = true
                }else{
                    result.Correct = false
                }
            }
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    
    
    
    
    
    func AddCore(venta : Ventas) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "Venta", in: context)
            let ventaCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            ventaCoreData.setValue(venta.Total, forKey: "total")
            ventaCoreData.setValue(venta.Fecha, forKey: "fecha")
            
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    func Update(venta : Ventas, idVenta : Int) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Venta")
            let ventaCoreData = try context.fetch(request) as! [NSManagedObject]
            
            ventaCoreData[idVenta].setValue(venta.Total, forKey: "total")
            ventaCoreData[idVenta].setValue(venta.Fecha, forKey: "fecha")
            
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
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Venta")
            let ventaCoreData = try context.fetch(request) as! [NSManagedObject]
            
            result.Objects = []
            for venta in ventaCoreData{
                let ventas = Ventas(IdVenta: Int(venta.objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!,
                                    Total: venta.value(forKey: "total") as! Double,
                                    Fecha: venta.value(forKey: "fecha") as! Date)
                
                result.Objects?.append(ventas)
            }
            result.Correct = true
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    func GetById(idVenta : Int) -> Result{
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Venta")
            let ventaCoreData = try context.fetch(request) as! [NSManagedObject]
            
            let venta = Ventas(IdVenta: Int(ventaCoreData[idVenta].objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!,
                               Total: ventaCoreData[idVenta].value(forKey: "total") as! Double,
                               Fecha: ventaCoreData[idVenta].value(forKey: "fecha") as! Date)
        }catch{
            
        }
        return result
    }
    
}
