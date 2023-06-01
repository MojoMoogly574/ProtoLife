//
//  ContentView.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import SwiftUI
import CoreData



struct ContentView: View {
    //MARK:  PROPERTIES
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults:
    FetchedResults<BudgetCategory>
    
    @State private var isPresented:   Bool = false
    
    
    var body: some View {
        NavigationStack  {
            VStack {
                List(budgetCategoryResults) { BudgetCategory in
                    Text(BudgetCategory.categoryName ?? "")
                }
                
            }
            .sheet(isPresented: $isPresented, content:  {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Category")   {
                        isPresented = true
                    }
                }
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
