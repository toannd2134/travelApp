//
//  FirebaseManager.swift
//  TravelApp
//
//  Created by Toan on 7/31/20.
//  Copyright © 2020 Toan. All rights reserved.
//


import Foundation
import Firebase

class FireBaseManager  {
    let db  = Firestore.firestore()
    static var Share = FireBaseManager()
    func creatUser (email : String , password :String ){
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            if let user = userResult?.user{
                print(user.email!)
                let userDefaul = UserDefaults.standard
                userDefaul.set(true, forKey: "SaveLogin")
            }  else {
                print(error?.localizedDescription)
            }
        }
    }
    func  SignOut(){
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
    }
    func SignIn(email :String,password :String , competion : @escaping (_ sucess : Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self ] (authResurt, error ) in
          if  let  Error = error {
                competion(false)
            }else{
                competion(true)
            let  UserDefault = UserDefaults.standard
            UserDefault.set(true, forKey: "SaveLogin")
            
            }
            
        }
    }
    func getData(nameUser : String ,email: String,valuetcket : String,localstart:String,localend : String ,dateStart : Date , dateEnd : Date ,numberPeople : Int , competion : @escaping (_ sucess : Bool) -> Void) {
          
         

    }
    
   
       
    
}
