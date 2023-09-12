//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userID: String
    init(userID: String){
        self.userID = userID
    }
    
    func delete(id: String){
       print("---->> Deleting item with ID, ", id)
    }
    
    func getSampleToDo() -> [ToDoListItem] {
        var data: [ToDoListItem] = []
        
        data.append(ToDoListItem(id: "1", title: "Sample to do List 1", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "2", title: "Sample to do List 2", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "3", title: "Sample to do List 3", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "4", title: "Sample to do List 4", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "5", title: "Sample to do List 5", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
        data.append(ToDoListItem(id: "6", title: "Sample to do List 6", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "7", title: "Sample to do List 7", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "8", title: "Sample to do List 8", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
        data.append(ToDoListItem(id: "9", title: "Sample to do List 9", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        data.append(ToDoListItem(id: "10", title: "Sample to do List 10", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        
        return data
        
    }
}
