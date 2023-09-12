//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation
class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var statusMsg = ""
    
    init(){
        
    }
    
    func login(){
        statusMsg = ""
        
        guard validate() else{
            return
        }
    
        //Try to sign in
        
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            statusMsg = "All fields are required."
            return false
        }
        
        //validate email in swifth
        guard isValidEmail(email: email) else{
            statusMsg = "Enter valid email address."
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
