import UIKit
//private let reuseIdentifier = "Cell"
class GetByIdDepartamentoCollectionViewController: UICollectionViewController {
    let productoViewModel = ProductoViewModel()
    var productos = [Producto]()
    var idDepartamento : Int = 2
    var busqueda : String = "MacBoock"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "ProductoVentasCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "ProductoCard")
        print("ViewDidLoad")
        loadData()

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
    
    func loadData(){
        if self.idDepartamento == nil {
            let result = productoViewModel.BusquedaAbierta(Busqueda: busqueda)
            if result.Correct{
                productos = result.Objects! as! [Producto]
                collectionView.reloadData()
            }else{
                //ALERT
                let alert = UIAlertController(title: "Error", message: "No se encontraron registros" + result.ErrorMessage, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Cerrar", style: .default)
                
                let Aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: { action in
                  })
                
                //alert.addAction(ok)
                alert.addAction(Aceptar)
                self.present(alert,animated: false)
            }
            
        }else{
            
        let result = productoViewModel.GetByIdDepartamento(IdDepartamento: idDepartamento)
        if result.Correct{
            productos = result.Objects! as! [Producto]
            collectionView.reloadData()
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
    }
    
    /*
    func Buscar(){
        let result = productoViewModel.BusquedaAbierta(Busqueda: busqueda)
        if result.Correct{
            productos = result.Objects! as! [Producto]
            collectionView.reloadData()
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
    */
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductoCard", for: indexPath) as! ProductoVentasCollectionViewCell
        // Configure the cell
        cell.ProductoImageView.image = UIImage(named: "image")
        cell.NombreText.text = productos[indexPath.row].Nombre
        cell.PrecioUnitarioText.text = String(productos[indexPath.row].PrecioUnitario)
        cell.StockText.text = String(productos[indexPath.row].Stock)
        cell.DescripcionText.text = productos[indexPath.row].Descripcion
    
        return cell
    }


}
