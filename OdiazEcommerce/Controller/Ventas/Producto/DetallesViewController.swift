import UIKit

class DetallesViewController: UIViewController {
    
    @IBOutlet weak var DetallesImageView: UIImageView!
    @IBOutlet weak var DetallesTableView: UITableView!
    @IBOutlet weak var ComprarButton: UIButton!
    
    let productoViewModel = ProductoViewModel()
    var producto = [Producto]()
    var idProducto : Int32 = 4
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        DetallesTableView.register(UINib(nibName: "DetallesTableViewCell", bundle: .main), forCellReuseIdentifier: "Detalles")
        print("ViewDidLoad")

    }
    
    
    func loadData() {
        let result = productoViewModel.GetById(IdProducto: idProducto)
        if result.Correct{
            producto = result.Objects as! [Producto]//Error de hilo//
            DetallesImageView.image = UIImage(named: "image")
            DetallesTableView.reloadData()
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
    
    
    @IBAction func ComprarActionButton(_ sender: UIButton) {
    }
    
}



extension DetallesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DetallesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetallesCeldaTableViewCell
        
        cell.NombreLabel.text = producto[indexPath.row].Nombre
        cell.PrecioLabel.text = String(producto[indexPath.row].PrecioUnitario)
        cell.StockLabel.text = String(producto[indexPath.row].Stock)
        cell.ProveedorLabel.text = String(producto[indexPath.row].Proveedor!.IdProveedor)
        cell.DepartamentoLabel.text = String(producto[indexPath.row].Departamento!.IdDepartamento)
        cell.DescripcionText.text = producto[indexPath.row].Descripcion
        //cell.DetallesImageView.image = UIImage(named: "image")
        //UIImage(named: areas[indexPath.row].Nombre)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /*
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.idArea = areas[indexPath.row].IdArea
        self.performSegue(withIdentifier: "FiltroAreaDepartamento", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FiltroAreaDepartamento"{
            let id = segue.destination as! GetByIdAreaCollectionViewController
            id.idArea = self.idArea
        }
        else if segue.identifier == "BuscarProductoSegue"{
            let busquedaTxt = segue.destination as! GetByIdDepartamentoCollectionViewController
            busquedaTxt.busqueda = self.BuscarTextField.text!
        }
        
    }
     */
}

