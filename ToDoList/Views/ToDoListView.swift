//
//  ToDoListView.swift
//  ToDoList
//
//  Created by MD Syble on 08/09/2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    
    
  private var itemsList: [ToDoListItem] = []
    
    private let userID: String
    
    init(userID: String){
        self.userID = userID
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userID: "1"))
        //users/<id>/todos/<entries>
        self.itemsList = viewModel.getSampleToDo()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(itemsList){
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                                .padding()
                            
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "0")
    }
}
