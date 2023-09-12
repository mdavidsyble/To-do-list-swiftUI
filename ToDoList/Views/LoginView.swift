//
//  LoginView.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
            //Header
                HeaderView(title: "To Do List", subTitle: "Get Things Done", angle: 15, backgroundColor: Color.pink
            )
            //Login Form
               
            Form{
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.bottom, 10)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                
                if !viewModel.statusMsg.isEmpty{
                    Text(viewModel.statusMsg)
                        .foregroundColor(Color.red)
                }
                
                TLButton(
                    title: "Log In",
                    backgroundColor: Color.blue) {
                        //Attempt login
                        viewModel.login()
                    }
                
            }
            .offset(y: -50)
            
            
            //create account
            VStack{
                Text("New Around here?")
                
                NavigationLink("Create An Account", destination: RegisterView())
            }.padding(.bottom, 50)
            Spacer()
        }}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
