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
    
    var categoryTotal: Double {
        budgetCategoryResults.reduce(0) { result, budgetCategory in
            return result + budgetCategory.categoryTotal
        }
    }
    
    
    var body: some View {
        NavigationStack  {
            
            VStack {
                
                Text(categoryTotal as NSNumber, formatter: NumberFormatter.currency)
                    .fontWeight(.bold)
                
                BudgetListView(budgetCategoryResults: budgetCategoryResults)
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
