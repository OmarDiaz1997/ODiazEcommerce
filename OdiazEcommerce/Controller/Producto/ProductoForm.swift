//
//  ProductoForm.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 28/12/22.
//

import Foundation
import UIKit
class ProductoForm: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var PrecioUnitarioField: UITextField!
    @IBOutlet weak var StockField: UITextField!
    @IBOutlet weak var ProveedorField: UITextField!
    @IBOutlet weak var DepartamentoField: UITextField!
    @IBOutlet weak var DescripcionField: UITextField!
    @IBOutlet weak var IdProductoField: UITextField!
    
    let productoViewModel = ProductoViewModel()
    var productoModel : Producto? = nil
    //var proveedorModel : Proveedor? = nil
    //var departamentoModel : Departamento? = nil
    var IdProducto : Int? = nil
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    func viewdidLoad(){
        super .viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.isEditing = false
        validar()
    }
    
    func validar(){
        if IdProducto == nil{
            //Mostrar buton que indique Agregar
            //Mostar el formulario vacio
            imageView.image = UIImage(named: "User")
        }else
        {
            // Mostar buton que inque Actualizar
            //Mostar el formulario precargado
            //Uso del GetById
            //CONVERTIR DE BASE64 a UIIMAGE
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IdProductoField.isHidden = false
        
    }
    
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        guard let Nombre = NombreField.text, Nombre != "" else{
            NombreField.placeholder = "Ingrese un nombre"
            return
        }
        
        guard let PrecioUnitario = PrecioUnitarioField.text, PrecioUnitario != "" else{
            PrecioUnitarioField.placeholder = "Ingrese un precio"
            return
        }
        
        guard let Stock = StockField.text, Stock != "" else{
            StockField.placeholder = "Ingrese un valor de stock"
            return
        }
        
        guard let Descripcion = DescripcionField.text, Descripcion != "" else{
            DescripcionField.placeholder = "Ingrese una descripcion"
            return
        }
        
        guard let IdProveedor = ProveedorField.text, IdProveedor != "" else{
            ProveedorField.placeholder = "Ingrese un proveedor"
            return
        }
        
        guard let IdDepartamento = DepartamentoField.text, IdDepartamento != "" else{
            DepartamentoField.placeholder = "Ingrese un departamento"
            return
        }
        
        let image = imageView.image! //Convertir a base64
                let imageString : String
                if imageView.restorationIdentifier == "User"{
                    imageString = ""
                }else{
                    let imageData = image.pngData()! as NSData
                    imageString = imageData.base64EncodedString(options: .lineLength64Characters)
                }
        
        
        productoModel = Producto(IdProducto: 0, Nombre: Nombre, PrecioUnitario: Double(PrecioUnitario)!, Stock: Int(Stock)!, Descripcion: Descripcion, Imagen: imageString,
                                 Proveedor: Proveedor(IdProveedor: Int(IdProveedor)!, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: Int(IdDepartamento)!, Nombre: ""))
        
        if sender.currentTitle == "INSERT"{
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
        else if sender.currentTitle == "UPDATE" {
            productoModel = Producto(IdProducto: IdProducto!, Nombre: Nombre, PrecioUnitario: Double(PrecioUnitario)!, Stock: Int(Stock)!, Descripcion: Descripcion, Imagen: imageString,
                                     Proveedor: Proveedor(IdProveedor: Int(IdProveedor)!, Nombre: "", Telefono: ""), Departamento: Departamento(IdDepartamento: Int(IdDepartamento)!, Nombre: ""))
            
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
    
    

    @IBAction func AddButton(_ sender: UIButton) {
        //IMPLEMENTAR VALIDACION GUARD LET // IF LET
        //let Nombre = NombreField.text!
        let PrecioUnitario = Double(PrecioUnitarioField.text!)
        let Stock = Int(StockField.text!)
        let Descripcion = DescripcionField.text!
        let IdProveedor = Int(ProveedorField.text!)
        let IdDepartamento = Int(DepartamentoField.text!)
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


                
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true,completion: nil)
        
    }
    
    @IBAction func CameraButton(_ sender: UIButton) {
        self.present(imagePicker, animated: true)
    }
    
    
    }
