//
//  GetAllTableViewController.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 30/12/22.
//

import UIKit
import SwipeCellKit

class GetAllTableViewController: UITableViewController {
    
    let productoViewModel = ProductoViewModel()
    var productos = [Producto]()
    var idProducto : Int = 0

    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductoCell")
        print("ViewDidLoad")
        loadData()

        //self.tableView.estimatedRowHeight = 250
        //self.tableView.rowHeight = UITableView.automaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            print("ViewWillAppear")
            loadData()
        }
        override func viewDidAppear(_ animated: Bool) {
            print("ViewDidAppear")
        }
        override func viewWillDisappear(_ animated: Bool) {
            print("ViewWillDisappear")
        }
        override func viewDidDisappear(_ animated: Bool) {
            print("ViewDidDisappear")
        }
        

    
    
    
    func loadData() {
        let result = productoViewModel.GetAll()
        if result.Correct{
            productos = result.Objects! as! [Producto]
            tableView.reloadData()
        }
        else{
            //ALERT
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
        return productos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductoCell", for: indexPath) as! ProductoTableViewCell

        // Configure the cell...
        //cell.delegate = self
        cell.IdProductolbl.text = String(productos[indexPath.row].IdProducto)
        cell.NombreField.text = productos[indexPath.row].Nombre
        cell.PrecioUnitarioField.text = String(productos[indexPath.row].PrecioUnitario)
        cell.StockField.text = String(productos[indexPath.row].Stock)
        cell.DescripcionField.text = productos[indexPath.row].Descripcion
        //productos.Proveedor = Proveedor()
        //cell.ProveedorField.text = String(productos[indexPath.row].IdProveedor)
        //cell.DepartamentoField.text = String(productos[indexPath.row].IdDepartamento)
        //cell.ImageUser.image = UIImage(named: "User")

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


extension GetAllTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
           
            let idProducto = self.productos[indexPath.row].IdProducto
            //print("La Celda es el indice: \(indexPath.row) y el IdProducto es: \(idProducto)")
            let result = self.productoViewModel.Delete(IdProducto: Int32(idProducto))
            if result.Correct{
                //Mensaje de Confirmacion
                let alert = UIAlertController(title: "Confirmación", message: "Producto eliminado correctamente"+result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
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
            self.loadData()
        }

        deleteAction.image = UIImage(named: "delete")

        return [deleteAction]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UpdateSegues"{
            let productoForm = segue.destination as! ProductoForm
            productoForm.IdProducto = self.idProducto
        }
    }
}
