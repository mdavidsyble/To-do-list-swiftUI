//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var statusMSG = ""
    @Published var showAlert = false
    //list of todos Object
    var toDoList: [ToDoListItem] = []
    //list of todos Dictionary
    var toDoListDictionary: [[String: Any]] = []
    
    init(){
        
    }
    func save(){
        statusMSG = ""
        guard canSave else{
            statusMSG = "Unable to save, please provide Title and Correct date"
            return
        }
        //Get current UserID
        let userID = "0"
        //Create Model
        let newItem = ToDoListItem(id: userID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        // Save model
        toDoList.append(newItem)
        toDoListDictionary.append(newItem.asDictionary())
        
        print("---> To Dos, ", toDoListDictionary);
    }
    
    var canSave: Bool{
        statusMSG = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            statusMSG = "Title is required."
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            statusMSG = "You selected an old date."
            return false;
        }
        
        return true
    }
}
