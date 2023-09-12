//
//  MainViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    init(){
        self.currentUserId = "0"
    }
    
    public var isSignedIn: Bool{
        let isLoggedin = true;
        return isLoggedin
    }
    
}
