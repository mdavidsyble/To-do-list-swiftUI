//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
        //toggle item
        var newItem = item
        newItem.setDone(!item.isDone)
        //update new Item
        print("Checked itemed ID, ", newItem.id);
    }
}
