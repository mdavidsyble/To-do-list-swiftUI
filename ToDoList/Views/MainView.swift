//
//  ContentView.swift
//  ToDoList
//
//  Created by MD Syble on 07/09/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //Signed in view
            landingPageView
           
        } else {
            LoginView()
        }
        
        
        
    }
    
    @ViewBuilder
    var landingPageView: some View{
        TabView{
            ToDoListView(userID: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
