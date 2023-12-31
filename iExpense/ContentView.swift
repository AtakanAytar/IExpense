//
//  ContentView.swift
//  iExpense
//
//  Created by Atakan Aytar on 2.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var addShowing = false
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items){ item in 
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name).font(.headline)
                            Text(item.type)
                            
                            
                        }
                        Spacer()
                        Text(item.amount,format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                    addShowing = true
                } label: {
                   Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $addShowing){
            AddView(expenses: expenses)
        }
        
    }
    
    func removeItems(at offsets:IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
