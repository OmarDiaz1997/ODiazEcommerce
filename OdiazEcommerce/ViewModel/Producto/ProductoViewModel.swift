import Foundation
import SQLite3
import CoreData
import UIKit

class ProductoViewModel {
    
    let ProductoModel : Producto? = nil
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    /*---------  ADD   --------*/
    func Add(producto : Producto) -> Result{
                
        var result = Result()
        let context = DB.init()
        let query = "INSERT INTO Producto(Nombre,PrecioUnitario,Stock,Descripcion,IdProveedor,IdDepartamento) VALUES(?,?,?,?,?,?)"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (producto.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_double(statement, 2, (producto.PrecioUnitario))
                sqlite3_bind_int(statement, 3, Int32(producto.Stock))
                sqlite3_bind_text(statement, 4, (producto.Descripcion as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 5, Int32(producto.Proveedor!.IdProveedor))
                sqlite3_bind_int(statement, 6, Int32(producto.Departamento!.IdDepartamento))
                
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
    
    
    
    /*---------  UPDATE   --------*/
    func Update(producto : Producto) -> Result {
        var result = Result()
        let context = DB.init()
        let query = "UPDATE Producto SET Nombre = ?, PrecioUnitario = ?, Stock = ?, Descripcion = ?, IdProveedor = ?, IdDepartamento = ? WHERE IdProducto = ?"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                sqlite3_bind_text(statement, 1, (producto.Nombre as NSString).utf8String, -1, nil)
                sqlite3_bind_double(statement, 2, (producto.PrecioUnitario))
                sqlite3_bind_int(statement, 3, Int32(producto.Stock))
                sqlite3_bind_text(statement, 4, (producto.Descripcion as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 5, Int32(producto.Proveedor!.IdProveedor))
                sqlite3_bind_int(statement, 6, Int32(producto.Departamento!.IdDepartamento))
                sqlite3_bind_text(statement, 7, (producto.Imagen as NSString).utf8String, -1, nil)
                sqlite3_bind_int(statement, 8, Int32(producto.IdProducto))
                
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
    
    
    /*---------  DELETE   --------*/
    func Delete(IdProducto: Int32)-> Result{//
        var result = Result()
        let context = DB.init()
        let query = "DELETE FROM Producto WHERE IdProducto = ?"
        var statement : OpaquePointer? = nil
        
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK {

            sqlite3_bind_int(statement, 1, IdProducto)

            if sqlite3_step(statement) == SQLITE_DONE {
                result.Correct = true
            } else {
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
    
    
    
    /*---------  GETALL   --------*/
    func GetAll() -> Result{
        var result = Result()
          let context = DB.init()
          let query = "SELECT IdProducto, Nombre, PrecioUnitario, Stock, Descripcion, IdProveedor, IdDepartamento FROM Producto"
          var statement : OpaquePointer? = nil
          do{
              if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                  
                  result.Objects = []
                  while sqlite3_step(statement) == SQLITE_ROW{
                      var producto = Producto()
                      producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                      producto.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                      producto.PrecioUnitario =   Double(sqlite3_column_double(statement, 2))
                      producto.Stock =   Int(sqlite3_column_int(statement, 3))
                      producto.Descripcion =   String(cString: sqlite3_column_text(statement, 4))
                      producto.Proveedor = Proveedor()
                      producto.Proveedor!.IdProveedor = Int(sqlite3_column_int(statement, 5))
                      producto.Departamento = Departamento()
                      producto.Departamento!.IdDepartamento = Int(sqlite3_column_int(statement, 6))
                      
                      result.Objects?.append(producto)
                  }
                  result.Correct = true
              }
          }catch let error{
              result.Correct = false
              result.Ex = error
              result.ErrorMessage = error.localizedDescription
          }
          return result
    }

    
    
    
    
    
    /*---------  GETBYID   --------*/
    func GetById(IdProducto: Int32) -> Result{
        var result = Result()
          let context = DB.init()
          let query = "SELECT IdProducto, Nombre, PrecioUnitario, Stock, Descripcion, IdProveedor, IdDepartamento FROM Producto WHERE IdProducto = \(IdProducto)"
          var statement : OpaquePointer? = nil
          do{
              if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                  while sqlite3_step(statement) == SQLITE_ROW{
                      var producto = Producto()
                      producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                      producto.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                      producto.PrecioUnitario =   Double(sqlite3_column_double(statement, 2))
                      producto.Stock =   Int(sqlite3_column_int(statement, 3))
                      producto.Descripcion =   String(cString: sqlite3_column_text(statement, 4))
                      producto.Proveedor = Proveedor()
                      producto.Proveedor!.IdProveedor = Int(sqlite3_column_int(statement, 5))
                      producto.Departamento = Departamento()
                      producto.Departamento!.IdDepartamento = Int(sqlite3_column_int(statement, 6))
                      
                      result.Object = producto
                  }
                  result.Correct = true
              }
          }catch let error{
              result.Correct = false
              result.Ex = error
              result.ErrorMessage = error.localizedDescription
          }
          return result
    }
    
    
    
    
    /*---------  GETBYIDDEPARTAMENTO   --------*/
    func GetByIdDepartamento(IdDepartamento: Int) -> Result{
        var result = Result()
          let context = DB.init()
          let query = "SELECT IdProducto, Nombre, PrecioUnitario, Stock, Descripcion, IdProveedor, IdDepartamento FROM Producto WHERE IdDepartamento = \(IdDepartamento)"
          var statement : OpaquePointer? = nil
          do{
              if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                  
                  result.Objects = []
                  while sqlite3_step(statement) == SQLITE_ROW{
                      var producto = Producto()
                      producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                      producto.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                      producto.PrecioUnitario =   Double(sqlite3_column_double(statement, 2))
                      producto.Stock =   Int(sqlite3_column_int(statement, 3))
                      producto.Descripcion =   String(cString: sqlite3_column_text(statement, 4))
                      producto.Proveedor = Proveedor()
                      producto.Proveedor!.IdProveedor = Int(sqlite3_column_int(statement, 5))
                      producto.Departamento = Departamento()
                      producto.Departamento!.IdDepartamento = Int(sqlite3_column_int(statement, 6))
                      
                      result.Objects?.append(producto)
                  }
                  result.Correct = true
              }
          }catch let error{
              result.Correct = false
              result.Ex = error
              result.ErrorMessage = error.localizedDescription
          }
          return result
    }
    
    
    
    
    
    /*---------  BUSQUEDA ABIERTA   --------*/
    func BusquedaAbierta(Busqueda: String) -> Result{
        var result = Result()
          let context = DB.init()
          let query = "SELECT IdProducto, Nombre, PrecioUnitario, Stock, Descripcion, Imagen, IdProveedor, IdDepartamento FROM Producto WHERE Nombre  like '%'||RTRIM(LTRIM('\(Busqueda)'))||'%'"
          var statement : OpaquePointer? = nil
          do{
              if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                  
                  result.Objects = []
                  while sqlite3_step(statement) == SQLITE_ROW{
                      var producto = Producto()
                      producto.IdProducto = Int(sqlite3_column_int(statement, 0))
                      producto.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                      producto.PrecioUnitario =   Double(sqlite3_column_double(statement, 2))
                      producto.Stock =   Int(sqlite3_column_int(statement, 3))
                      producto.Descripcion =   String(cString: sqlite3_column_text(statement, 4))
                      producto.Imagen = ""//String(cString: sqlite3_column_text(statement, 5))
                      producto.Proveedor = Proveedor()
                      producto.Proveedor!.IdProveedor = Int(sqlite3_column_int(statement, 6))
                      producto.Departamento = Departamento()
                      producto.Departamento!.IdDepartamento = Int(sqlite3_column_int(statement, 7))
                      
                      result.Objects?.append(producto)
                  }
                  result.Correct = true
              }
          }catch let error{
              result.Correct = false
              result.Ex = error
              result.ErrorMessage = error.localizedDescription
          }
          return result
    }
    
    

    
    
    
}
