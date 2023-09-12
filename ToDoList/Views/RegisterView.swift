//
//  RegisterView.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewViewModel()
   
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subTitle: "Start Organizing Todos", angle: -15, backgroundColor: Color.orange)
            //Registration form
            //Login Form
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding(.bottom, 5)
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.bottom, 5)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 5)
                
                TLButton(
                    title: "Create Account",
                    backgroundColor: Color.green) {
                        //Attempt Registeration
                        viewModel.register()
                    }
                
              
            }
            .offset(y: -50)
            
            Spacer()
            
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
