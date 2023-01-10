//
//  GetAllDepartamentoTableViewController.swift
//  OdiazEcommerce
//
//  Created by Omar Diaz on 08/01/23.
//

import UIKit
import SwipeCellKit

class GetAllDepartamentoTableViewController: UITableViewController {
    let departamentoViewModel = DepartamentoViewModel()
    var departamentos = [Departamento]()
    var idDepartamento = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "DepartamentoTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartamentoCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func AddButton(_ sender: UIButton) {
        
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
        let result = departamentoViewModel.GetAll()
        if result.Correct{
            departamentos = result.Objects! as! [Departamento]
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
        return departamentos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartamentoCell", for: indexPath) as! DepartamentoTableViewCell
        // Configure the cell...
        cell.delegate = self
        cell.NombreCell.text = departamentos[indexPath.row].Nombre
        cell.AreaCell.text = String(departamentos[indexPath.row].Area!.IdArea)

        return cell
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


extension GetAllDepartamentoTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        if orientation == .right {
            
            //delete
            let deleteAction = SwipeAction(style: .destructive, title: "Eliminar") { action, indexPath in
                
                self.idDepartamento = self.departamentos[indexPath.row].IdDepartamento
                let result = self.departamentoViewModel.Delete(IdDepartamento: Int32(self.idDepartamento))
                self.loadData()
                
                //ALERT
                if result.Correct{
                    let alert  = UIAlertController(title: "Confirmación", message: "Departamento eliminado", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Aceptar", style: .default)
                    
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
                    
                }
                else{
                    let alertError  = UIAlertController(title: "Error", message: "Departamento no eliminado", preferredStyle: .alert)
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
                
                self.idDepartamento = self.departamentos[indexPath.row].IdDepartamento
                let result = self.performSegue(withIdentifier: "SegueUpdate", sender: self)
            }
            updateAction.image = UIImage(systemName: "repeat")
            updateAction.backgroundColor = .blue
            return [updateAction]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueUpdate"{
            let departamentoForm = segue.destination as! DepartamentoViewController
            departamentoForm.idDepartamento = self.idDepartamento
        }
    }
}
