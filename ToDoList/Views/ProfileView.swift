//
//  ProfileView.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    init(){
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }else{
                    Text("Loading profile..");
                }
                
                
                
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        //Avator
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        //Info: Name, Email, Member
        VStack(alignment: .leading){
            HStack{
                Text("Name: ").bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ").bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
   
        Button("Log out"){
            viewModel.logOut()
        }.foregroundColor(Color.white)
            .padding()
            .background(Color.red)
            .fontWeight(.bold)
        
        Spacer()
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
