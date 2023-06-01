//
//  AddBudgetCategoryView.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    //MARK:   PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var categoryName: String = ""
    @State private var categoryTotal :  Double =  100
    @State private var messages: [String] = [ ]
    
    
    //MARK:  VALIDATING THE FORM
    var isFormValid: Bool {
        messages.removeAll( )
        if categoryName.isEmpty {
            messages.append("A category name is required.")
        }
        if categoryTotal <= 0 {
            messages.append("Category total should be greater than 1.")
        }
        return messages.count == 0
    }
    //MARK:   SAVE( )
    
    private func save( ) {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.categoryName = categoryName
        budgetCategory.categoryTotal = categoryTotal
        
        do {
            try viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
      
    }
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $categoryName)
                Slider(value:  $categoryTotal, in: 0...5000, step: 25)  {
                    Text("Total")
                }minimumValueLabel: {
                    Text( "$0")
                }maximumValueLabel: {
                    Text("$5000")
                }
                
                HStack {
                    Text("Amount Selected:  ")
                    Text(categoryTotal as NSNumber, formatter:  NumberFormatter.currency)
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach (messages, id: \.self) { messages in
                    Text(messages)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel")  {
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save")  {
                        if isFormValid  {
                            save()
                        }
                    }
                }
            }
        }
    }
}
struct AddBudgetCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetCategoryView()
    }
}
