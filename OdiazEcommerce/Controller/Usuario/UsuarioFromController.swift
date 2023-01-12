//
//  UsuarioFromController.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 09/01/23.
//

import UIKit

class UsuarioFromController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var idUsuario : Int? = nil
    let usuarioViewModel = UsuarioViewModel()
    var usuarioModel : Usuario? = nil
    
    
    @IBOutlet weak var UserTextField: UITextField!
    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var ApellidoPaternoTextField: UITextField!
    @IBOutlet weak var ApellidoMaternoTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SexoTextField: UITextField!
    /*   FECHA DE NACIMIENTO   */
    @IBOutlet weak var FechaNacimientoPicker: UIDatePicker!
    @IBOutlet weak var TeleFonoTextField: UITextField!
    @IBOutlet weak var CelularTextField: UITextField!
    @IBOutlet weak var CURPTextField: UITextField!
    @IBOutlet weak var ActionButton: UIButton!
    /*   IMAGEN   */
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    func viewdidLoad(){
        super .viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.isEditing = false
        Validar()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            //var usuario = Usuario()
            //usuario.Nombre = "Jose"
            //usuario.ApellidoPaterno = "Becerra"
            //usuario.ApellidoMaterno = "Perez"
            
            //usuarioViewModel.GetAll()
            
            //usuarioViewModel.Add(usuario: usuario)
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.isEditing = false
        Validar()
    }
    

    func Validar(){
        if self.idUsuario == nil {
            imageView.image = UIImage(named: "User")
            ActionButton.setTitle("Agregar", for: .normal)
        }else{
            ActionButton.setTitle("Actualizar", for: .normal)
            
            let result : Result = usuarioViewModel.GetById(idUsuario: idUsuario!)
            if result.Correct{
                let usuario = result.Object! as! Usuario
                UserTextField.text = usuario.UserName
                NombreTextField.text = usuario.Nombre
                ApellidoPaternoTextField.text = usuario.ApellidoPaterno
                ApellidoMaternoTextField.text = usuario.ApellidoMaterno
                EmailTextField.text = usuario.Email
                PasswordTextField.text = usuario.Password
                FechaNacimientoPicker.date = usuario.FechaNacimiento
                SexoTextField.text = usuario.Sexo
                TeleFonoTextField.text = usuario.Telefono
                CelularTextField.text = usuario.Celular
                CURPTextField.text = usuario.CURP
                if usuario.Imagen == ""{
                    imageView.image = UIImage(named: "User")
                }else{
                    imageView.image = UIImage(data: Data(base64Encoded: usuario.Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!)
                }
            }else{
                print("Error")
            }
        }
    }
    
    
    @IBAction func ActionButton(_ sender: UIButton) {
        guard let UserName = UserTextField.text, UserName != "" else{
            UserTextField.placeholder = "Ingrese un nombre de usuario"
            return
        }
        
        guard let Nombre = NombreTextField.text, Nombre != "" else{
            NombreTextField.placeholder = "Ingrese un nombre"
            return
        }
        
        guard let ApellidoPaterno = ApellidoPaternoTextField.text, ApellidoPaterno != "" else{
            ApellidoPaternoTextField.placeholder = "Ingrese un apellido"
            return
        }
        
        guard let ApellidoMaterno = ApellidoMaternoTextField.text, ApellidoMaterno != "" else{
            ApellidoMaternoTextField.placeholder = "Ingrese un apellido"
            return
        }
        
        guard let Email = EmailTextField.text, Email != "" else{
            EmailTextField.placeholder = "Ingrese un email"
            return
        }
        
        guard let Password = PasswordTextField.text, Password != "" else{
            PasswordTextField.placeholder = "Ingrese un password"
            return
        }
        
        guard let Sexo = SexoTextField.text, Sexo != "" else{
            SexoTextField.placeholder = "Ingrese un sexo"
            return
        }
        
        guard let Telefono = TeleFonoTextField.text, Telefono != "" else{
            TeleFonoTextField.placeholder = "Ingrese un telefono"
            return
        }
        
        guard let Celular = CelularTextField.text, Celular != "" else{
            CelularTextField.placeholder = "Ingrese uncelular"
            return
        }
        
        guard let CURP = CURPTextField.text, CURP != "" else{
            CURPTextField.placeholder = "Ingrese un CURP"
            return
        }
        
        let fechaString : Date? = nil
        //var dateStringFormater = DateFormatter()
        //dateStringFormater.dateFormat = fechaString
        //var dateFromString = dateStringFormater.date(from: fechaString)
        
        /*     imagen a base 64     */
        let image = imageView.image! //Convertir a base64
                let imageString : String
                if imageView.restorationIdentifier == "User"{
                    imageString = ""
                }else{
                    let imageData = image.pngData()! as NSData
                    imageString = imageData.base64EncodedString(options: .lineLength64Characters)
                }
        
        
        usuarioModel = Usuario(IdUsuario: 0, UserName: UserName, Nombre: Nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Email: Email, Password: Password, FechaNacimiento: fechaString!, Sexo: Sexo, Telefono: Telefono, Celular: Celular, CURP: CURP, Imagen: imageString)
        
        
        if(sender as AnyObject).currentTitle == "Agregar"{
            let result = usuarioViewModel.Add(usuario: usuarioModel!)
            
            if result.Correct{
                //Mensaje de Confirmacion
                let alert = UIAlertController(title: "Confirmación", message: "Usuario agregado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                    //self.NombreTextField = ""
                    //self.AreaTextField.text = ""
                  })
                
                alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            else{
                let alert = UIAlertController(title: "Error", message: "El usuario no se agrego correctamente " + result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                  })
                
                alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            
            
            /* UPDATE  */
        }else if (sender as AnyObject).currentTitle == "Actualizar"{
            let id : Int? = nil
            usuarioModel = Usuario(IdUsuario: id!, UserName: UserName, Nombre: Nombre, ApellidoPaterno: ApellidoPaterno, ApellidoMaterno: ApellidoMaterno, Email: Email, Password: Password, FechaNacimiento: fechaString!, Sexo: Sexo, Telefono: Telefono, Celular: Celular, CURP: CURP, Imagen: imageString)
            
            let result = usuarioViewModel.Update(usuario: usuarioModel!, idUsuario: id!)
            
            if result.Correct{
                let alert = UIAlertController(title: "Confirmación", message: "Usuario actualizado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                //let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                    self.dismiss(animated: true)
                  })
                
                //alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            else{
                let alert = UIAlertController(title: "Error", message: "El usuario no se actualizo correctamente " + result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                  })
                
                alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        
        dismiss(animated: true,completion: nil)
        
    }
    
    @IBAction func ImageCamera(_ sender: UIButton) {
        self.present(imagePicker, animated: true)
    }
    
    
}
