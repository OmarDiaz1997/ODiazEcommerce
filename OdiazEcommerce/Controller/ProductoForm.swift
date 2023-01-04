//
//  ProductoForm.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 28/12/22.
//

import Foundation
import UIKit
class ProductoForm: UIViewController {

    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var PrecioUnitarioField: UITextField!
    @IBOutlet weak var StockField: UITextField!
    @IBOutlet weak var ProveedorField: UITextField!
    @IBOutlet weak var DepartamentoField: UITextField!
    @IBOutlet weak var DescripcionField: UITextField!
    @IBOutlet weak var IdProductoField: UITextField!
    
    let productoViewModel = ProductoViewModel()
    var productoModel : Producto? = nil
    var proveedorModel : Proveedor? = nil
    var departamentoModel : Departamento? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IdProductoField.isHidden = false
        
    }

    @IBAction func AddButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let Nombre = NombreField.text!
        let PrecioUnitario = Double(PrecioUnitarioField.text!)
        let Stock = Int(StockField.text!)
        let Descripcion = DescripcionField.text!
        let IdProveedor = Int(ProveedorField.text!)
        let IdDepartamento = Int(DepartamentoField.text!)
        //productoModel?.departamento = Departamento()
        //productoModel?.proveedor = Proveedor()
        //proveedor = Proveedor()

        productoModel = Producto(IdProducto: 0, Nombre: Nombre, PrecioUnitario: PrecioUnitario!, Stock: Stock!, Descripcion: Descripcion,
                                 Proveedor: Proveedor(IdProveedor: IdProveedor!, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: IdDepartamento!, Nombre: ""))
        
        let result = productoViewModel.Add(producto: productoModel!)
        
        if result.Correct{
                    //Mensaje de Confirmacion
                    let alert = UIAlertController(title: "Confirmación", message: "Producto agregado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                        self.NombreField.text = ""
                        self.PrecioUnitarioField.text = ""
                        self.StockField.text = ""
                        self.DescripcionField.text = ""
                        self.ProveedorField.text = ""
                        self.DescripcionField.text = ""
                        self.IdProductoField.text = ""
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "El produto no se agrego correctamente " + result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
                
            }
    
    @IBAction func DeleteButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let IdProducto = Int32(IdProductoField.text!)

        //productoModel = Producto(IdProducto: IdProducto!, Nombre: "", PrecioUnitario: 0.0, Stock: 0, Descripcion: "",
          //                       Proveedor: Proveedor(IdProveedor: 0, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: 0, Nombre: ""))
        
        
        let result = productoViewModel.Delete(IdProducto: IdProducto!)
        
        if result.Correct{
                    //Mensaje de Confirmacion
                    let alert = UIAlertController(title: "Confirmación", message: "Producto eliminado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                        self.NombreField.text = ""
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "El produto no se elimino correctamente " + result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
    }
    
    
    
    
    
    @IBAction func UpdateButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        let IdProducto = Int(IdProductoField.text!)
        let Nombre = NombreField.text!
        let PrecioUnitario = Double(PrecioUnitarioField.text!)
        let Stock = Int(StockField.text!)
        let Descripcion = DescripcionField.text!
        let IdProveedor = Int(ProveedorField.text!)
        let IdDepartamento = Int(DepartamentoField.text!)
        //productoModel?.departamento = Departamento()
        //productoModel?.proveedor = Proveedor()
        //proveedor = Proveedor()

        productoModel = Producto(IdProducto: IdProducto!, Nombre: Nombre, PrecioUnitario: PrecioUnitario!, Stock: Stock!, Descripcion: Descripcion,
                                 Proveedor: Proveedor(IdProveedor: IdProveedor!, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: IdDepartamento!, Nombre: ""))
        
        let result = productoViewModel.Update(producto: productoModel!)
        
        if result.Correct{
                    //Mensaje de Confirmacion
                    let alert = UIAlertController(title: "Confirmación", message: "Producto actualizado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                        self.NombreField.text = ""
                        self.PrecioUnitarioField.text = ""
                        self.StockField.text = ""
                        self.DescripcionField.text = ""
                        self.ProveedorField.text = ""
                        self.DescripcionField.text = ""
                        self.IdProductoField.text = ""
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
                else{
                    let alert = UIAlertController(title: "Error", message: "El produto no se actualizo correctamente " + result.ErrorMessage, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Cerrar", style: .default)
                    
                    let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                      })
                    
                    alert.addAction(ok)
                    alert.addAction(Aceptar)
                    self.present(alert,animated: false)
                }
                
    }
    
    
    }
