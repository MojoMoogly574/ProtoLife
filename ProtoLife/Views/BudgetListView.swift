//
//  BudgetListView.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import SwiftUI

struct BudgetListView: View {
//MARK:  PROPERTIES
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    
    
    
    
    var body: some View {
        
        List {
            
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults) { budgetCategory in
                    HStack {
                        Text(budgetCategory.categoryName ?? "")
                        Spacer( )
                        VStack {
                            Text(budgetCategory.categoryTotal as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }
            } else {
                Text("Add a Category and Build Your Budget💲")
            }
        }
    }
}
