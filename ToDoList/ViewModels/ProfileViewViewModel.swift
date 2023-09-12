//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init(){
        
    }
    
    func fetchUser(){
        DispatchQueue.main.async {
            self.user = User(id: "1", name: "David Mugisha", email: "Mugisha David Syble", joined: Date().timeIntervalSince1970)
        }
        
    }
    
    func logOut(){
        //firebase
        do{
            print("---->Signing out!")
            //try Auth.auth().signOut()
        }catch{
            print("---->>Failed")
        }
    }
}
