import UIKit

private let reuseIdentifier = "Cell"

class GetByIdAreaCollectionViewController: UICollectionViewController {
    let departamentoViewModel = DepartamentoViewModel()
    var departamentos = [Departamento]()
    var idArea: Int = 0
    var idDepartamento: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "VentasCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AreaCard")
        print("ViewDidLoad")
        loadData()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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
        let result = departamentoViewModel.GetByIdAREA(IdArea: idArea)
        if result.Correct{
            departamentos = result.Objects! as! [Departamento]
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
        return departamentos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AreaCard", for: indexPath) as! VentasCardCollectionViewCell 
    
        cell.AreaCell.text = departamentos[indexPath.row].Nombre
        cell.AreaImageView.image = UIImage(named: "image")
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        self.idDepartamento = departamentos[indexPath.row].IdDepartamento
        self.performSegue(withIdentifier: "FiltroDepartamentoProducto", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FiltroDepartamentoProducto"{
            let id = segue.destination as! GetByIdDepartamentoCollectionViewController
            id.idDepartamento = self.idDepartamento
        }
    }

}
