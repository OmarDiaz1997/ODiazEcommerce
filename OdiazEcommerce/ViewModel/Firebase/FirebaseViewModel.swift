import Foundation
import Firebase

class FirebaseViewModel : ObservableObject {
    public static let shared = FirebaseViewModel()
    @Published var show = false
    
    func Login(emai : String, pass : String, completion : @escaping(_ done: Bool) -> Void) {
        Auth.auth().signIn(withEmail: emai, password: pass) { (user, error) in
            if user != nil{
                print("Entro")
            }else{
                if let error = error?.localizedDescription{
                    print("Error en firebase", error)
                }else{
                        print("Error en la aplicacion")
                    }
                }
                
            }
        }
    
    
    func Register(email : String, pass : String, completion : @escaping(_ done: Bool) -> Void){
        Auth.auth().createUser(withEmail: email, password: pass){(user, error) in
            if user != nil{
                print("Entro")
            }else{
                if let error = error?.localizedDescription{
                    print("Entro y se registro", error)
                }else{
                        print("Error en la aplicacion")
                    }
                }
        }
    }
}
	
