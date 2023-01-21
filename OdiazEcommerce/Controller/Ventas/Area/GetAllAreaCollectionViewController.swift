import UIKit

class GetAllAreaCollectionViewController: UICollectionViewController {
    //Llamar al modelo
    let areaViewModel = AreaViewModel()
    var areas = [Area]()
    
    //Almacenar id de Area
    var idArea : Int! = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "VentasCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AreaCard")
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
    
    
    func loadData() {
        let result = areaViewModel.GetAll()
        if result.Correct{
            areas = result.Objects! as! [Area]
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
    




    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        areas.count
    }
  
     override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AreaCard", for: indexPath) as! VentasCardCollectionViewCell
        
        cell.AreaCell.text = areas[indexPath.row].Nombre
        cell.AreaImageView.image = UIImage(named: "image")
        //UIImage(named: areas[indexPath.row].Nombre)
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.idArea = areas[indexPath.row].IdArea
        self.performSegue(withIdentifier: "FiltroAreaDepartamento", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FiltroAreaDepartamento"{
            let id = segue.destination as! GetByIdAreaCollectionViewController
            id.idArea = self.idArea
        }
    }

}
