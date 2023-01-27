//
//  AuthUsuarioViewController.swift
//  OdiazEcommerce
//
//  Created by MacbookMBA8 on 13/01/23.
//

import UIKit
import FirebaseAnalytics

class AuthUsuarioViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SingUpButton: UIButton!
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //analyticd
        
    }
    
    @IBAction func SingInActionButton(_ sender: UIButton) {

        //FirebaseViewModel.shared.
    }
    
    @IBAction func RegiterButtonAction(_ sender: UIButton) {
        guard let email = EmailTextField.text else { return }
        guard let pass = PasswordTextField.text else { return }
    }
    

    @IBAction func LogInButtonAction(_ sender: UIButton) {
        guard let email = EmailTextField.text else { return }
        guard let pass = PasswordTextField.text else { return }
        FirebaseViewModel.shared.Login(emai: email, pass: pass){(done) in
            if done {
                self.next(identificador: "LogIn")
            }
        }
    }
    
    func next(identificador : String){
        performSegue(withIdentifier: identificador, sender: self)
    }
    
}
