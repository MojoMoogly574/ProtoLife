//
//  BudgetCategory+CoreDataClass.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory:  NSManagedObject {
    //with each new category added, this function will insert a new date created for each additional category.
    public override func awakeFromInsert() {
        self.dateCreated = Date( )
    }
}
