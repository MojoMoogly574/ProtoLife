//
//  ProtoLifeApp.swift
//  ProtoLife
//
//  Created by Joseph DeWeese on 6/1/23.
//

import SwiftUI

@main
struct ProtoLifeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
