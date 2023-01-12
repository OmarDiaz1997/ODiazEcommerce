//
//  GetAllUsuarioTableViewController.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 10/01/23.
//

import UIKit
import SwipeCellKit

class GetAllUsuarioTableViewController: UITableViewController {

    let usuarioViewModel = UsuarioViewModel()
    var usuarios = [Usuario]()
    var idUsuario : Int = 0
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        /*  Instancia de un metodo
        let usuario = UsuarioViewModel()
        usuario.GetAll()*/

        
        tableView.register(UINib(nibName: "UsuarioTableViewCelda", bundle: nil), forCellReuseIdentifier: "UsuarioCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    
    
    override func viewWillAppear(_ animated: Bool) {
            print("ViewWillApper")
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    
    func loadData(){
        let result = usuarioViewModel.GetAll()
        if result.Correct{
            usuarios = result.Objects! as! [Usuario]
            tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Error", message: "No se encontraron registros" + result.ErrorMessage, preferredStyle: .alert)
            let ok = UIAlertAction(title: "Cerrar", style: .default)
            
            let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
              })
            
            //alert.addAction(ok)
            alert.addAction(Aceptar)
            self.present(alert,animated: false)
        }
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usuarios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsuarioCell", for: indexPath) as! UsuarioTableViewCelda
        // Configure the cell...
        cell.delegate = self
        cell.UserNameCell.text = usuarios[indexPath.row].UserName
        cell.NombreCell.text = usuarios[indexPath.row].Nombre
        cell.ApellidoPaternoCell.text = usuarios[indexPath.row].ApellidoPaterno
        cell.ApellidoMaternoCell.text = usuarios[indexPath.row].ApellidoMaterno
        cell.EmailCell.text = usuarios[indexPath.row].Email
        cell.PasswordCell.text = usuarios[indexPath.row].Password
        //cell.FechaNacimientoCell.text = usuarios[indexPath.row].FechaNacimiento
        cell.SexoCell.text = usuarios[indexPath.row].Sexo
        cell.TelefonoCell.text = usuarios[indexPath.row].Telefono
        cell.CelularCell.text = usuarios[indexPath.row].Celular
        cell.CURPCell.text = usuarios[indexPath.row].CURP
        
        if usuarios[indexPath.row].Imagen
            == ""{
            cell.imageViewCell.image = UIImage(named: "User")
        }else{
            cell.imageViewCell.image = UIImage(data: Data(base64Encoded: usuarios[indexPath.row].Imagen, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!)
        }

        return cell
    }
    

    @IBAction func Add(_ sender: UIBarButtonItem) {
        //ActionButton.setTitle("Agregar", for: .normal)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}


extension GetAllUsuarioTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        if orientation == .right {
            
            //delete
            let deleteAction = SwipeAction(style: .destructive, title: "Eliminar") { action, indexPath in
                
                self.idUsuario = self.usuarios[indexPath.row].IdUsuario
                let result = self.usuarioViewModel.Delete(idUsuario: self.idUsuario)
                self.loadData()
                
                //ALERT
                if result.Correct{
                    let alert  = UIAlertController(title: "Confirmación", message: "Usuario eliminado", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Aceptar", style: .default)
                    
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    
                }
                else{
                    let alertError  = UIAlertController(title: "Error", message: "Usuario no eliminado", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .default)
            
            alertError.addAction(ok)
            
            self.present(alertError, animated: false)
                    
                }
            }
            deleteAction.image = UIImage(systemName: "trash")
            return [deleteAction]
            
            
        }else{
            
            //update
            let updateAction = SwipeAction(style: .default, title: "Actualizar") { action, indexPath in
                
                self.idUsuario = self.usuarios[indexPath.row].IdUsuario
                let result = self.performSegue(withIdentifier: "SegueUpdate", sender: self)
            }
            updateAction.image = UIImage(systemName: "repeat")
            updateAction.backgroundColor = .blue
            return [updateAction]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueUpdate"{
            let usuarioForm = segue.destination as! UsuarioFromController
            usuarioForm.idUsuario = self.idUsuario
        }
    }
}
