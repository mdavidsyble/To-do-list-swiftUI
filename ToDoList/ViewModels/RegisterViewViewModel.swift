//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var statusMsg = ""
    init(){
        
    }
    
    func register(){
        statusMsg = ""
        
        guard validate() else{
            return
        }
    
        //Try to register
        //code here
        //get user id
        let userID = "0";
        insertUserRecord(id: userID)
        
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        //Operations to save user here.
        let testObject = newUser.asDictionary()
        print("Registering User: --------> ", testObject)
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            statusMsg = "All fields are required."
            return false
        }
        
        //validate email in swifth
        guard isValidEmail(email: email) else{
            statusMsg = "Enter valid email address."
            return false
        }
        
        guard password.count >= 6 else {
            statusMsg = "Password Should be atleast 6 Characters"
            return false
        }
        
        return true
    }
    
    
    
    func isValidEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: email)
    }
}
