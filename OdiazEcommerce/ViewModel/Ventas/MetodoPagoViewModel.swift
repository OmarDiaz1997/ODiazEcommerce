import Foundation
import UIKit
import CoreData

class MetodoPagoViewModel{
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func Add(metodoPagos : MetodoPagos) -> Result{
        
        var result = Result()
        do{
            let context = appDelegate.persistentContainer.viewContext
            let entidad = NSEntityDescription.entity(forEntityName: "MetodoPago", in: context)
            let usuarioCoreData = NSManagedObject(entity: entidad!, insertInto: context)
            
            usuarioCoreData.setValue(metodoPagos.Metodo, forKey: "metodo")
            
            try! context.save()
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
    
    /* GET BY ID */
    func GetById(IdMetodoPago : Int) -> Result{
        var result = Result()
        
        do{
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MetodoPago")
            let metodo = try context.fetch(request) as! [NSManagedObject]
            
            let metodoPago = MetodoPagos(IdMetodoPago: Int(metodo[IdMetodoPago].objectID.uriRepresentation().absoluteString.components(separatedBy: "/p")[1])!,
                                         Metodo: metodo[IdMetodoPago].value(forKey: "metodo") as! String)
            result.Object = metodoPago
            result.Correct = true
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        return result
    }
    
    
}
