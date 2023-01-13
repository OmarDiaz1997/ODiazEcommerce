//
//  AreaViewModel.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 12/01/23.
//

import Foundation
import SQLite3

class AreaViewModel {
    
    let areaModel : Area? = nil
    
    
    /*---------  GETALL   --------*/
    func GetAll() -> Result{
        var result = Result()
        let context = DB.init()
        let query = "SELECT IdArea, Nombre FROM AREA"
        var statement : OpaquePointer? = nil
        do{
            if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
                
                result.Objects = []
                while sqlite3_step(statement) == SQLITE_ROW{
                    var area = Area()
                    area.IdArea = Int(sqlite3_column_int(statement, 0))
                    area.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                    
                    result.Objects?.append(area)
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
    func GetByIdArea(IdArea: Int) -> Result{
        var result = Result()
          let context = DB.init()
          let query = "SELECT IdArea, Nombre FROM AREA WHERE IdArea = ?"
          var statement : OpaquePointer? = nil
          do{
              if try sqlite3_prepare_v2(context.db, query, -1, &statement, nil) == SQLITE_OK{
        
                  while sqlite3_step(statement) == SQLITE_ROW{
                      var area = Area()
                      area.IdArea = Int(sqlite3_column_int(statement, 0))
                      area.Nombre =   String(cString: sqlite3_column_text(statement, 1))
                      
                      result.Object = area
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
