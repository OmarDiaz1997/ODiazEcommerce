//
//  DepartamentoViewController.swift
//  OdiazEcommerce
//
//  Created by Omar Diaz on 08/01/23.
//

import UIKit

class DepartamentoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var AreaTextField: UITextField!
    @IBOutlet weak var ActionButton: UIButton!
    
    var idDepartamento : Int? = nil
    let departamentoViewModel = DepartamentoViewModel()
    var departamentoModel : Departamento? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Validar()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func Validar(){
        if self.idDepartamento == nil {
            ActionButton.setTitle("Agregar", for: .normal)
        }else{
            ActionButton.setTitle("Actualizar", for: .normal)
            
            let result : Result = departamentoViewModel.GetById(IdDepartamento: idDepartamento!)
            if result.Correct{
                let departamento = result.Object! as! Departamento
                
                NombreTextField.text = departamento.Nombre
                AreaTextField.text = String(departamento.Area!.IdArea)
            }else{
                print("Error")
            }
        }
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        guard let Nombre = NombreTextField.text, Nombre != "" else{
            NombreTextField.placeholder = "Ingrese un nombre"
            return
        }
        
        guard let IdArea = AreaTextField.text, IdArea != "" else{
            AreaTextField.placeholder = "Ingrese el area"
            return
        }
        
        departamentoModel = Departamento(IdDepartamento: 0, Nombre: Nombre, Area: Area(IdArea: Int(IdArea)!, Nombre: ""))
        
        if(sender as AnyObject).currentTitle == "Agregar"{
            let result = departamentoViewModel.Add(departamento: departamentoModel!)
            
            if result.Correct{
                //Mensaje de Confirmacion
                let alert = UIAlertController(title: "Confirmación", message: "Departamento agregado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                    //self.NombreTextField = ""
                    self.AreaTextField.text = ""
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
            
            
            /* UPDATE  */
        }else if (sender as AnyObject).currentTitle == "Actualizar"{
            departamentoModel = Departamento(IdDepartamento: self.idDepartamento!, Nombre: Nombre, Area: Area(IdArea: Int(IdArea)!, Nombre: ""))
            
            let result = departamentoViewModel.Update(departamento: departamentoModel!)
            
            if result.Correct{
                let alert = UIAlertController(title: "Confirmación", message: "Departamento actualizado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                //let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                    self.dismiss(animated: true)
                  })
                
                //alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            else{
                let alert = UIAlertController(title: "Error", message: "El departamento no se actualizo correctamente " + result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                  })
                
                alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            }
        }
        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


