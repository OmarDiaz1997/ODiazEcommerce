import UIKit

class GetAllAreaViewController: UIViewController{
    
    @IBOutlet weak var BuscarTextField: UITextField!
    @IBOutlet weak var BuscarButton: UIButton!
    @IBOutlet weak var AreasCollectionView : UICollectionView!
    
    //Llamar al modelo
    let areaViewModel = AreaViewModel()
    var areas = [Area]()
    
    //Almacenar id de Area
    var idArea : Int! = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView.delegate = self
        //self.collectionView.dataSource = self
        loadData()
        AreasCollectionView.register(UINib(nibName: "VentasCardCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "AreaCard")
        print("ViewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewWillAppear")
        //loadData()
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
        let result = areaViewModel.GetAll()
        if result.Correct{
            areas = result.Objects! as! [Area]
            AreasCollectionView.reloadData()
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
    
    
    
    @IBAction func ActionBuscar(_ sender: UIButton) {
        performSegue(withIdentifier: "BuscarProductoSegue", sender: self)
    }
    

                                  

}



extension GetAllAreaViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AreaCard", for: indexPath) as! VentasCardCollectionViewCell
        cell.AreaCell.text = areas[indexPath.row].Nombre
        cell.AreaImageView.image = UIImage(named: "image")
        UIImage(named: areas[indexPath.row].Nombre)
        
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
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
}

