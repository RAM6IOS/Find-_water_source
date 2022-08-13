//
//  sourceApp.swift
//  source
//
//  Created by Bouchedoub Rmazi on 9/4/2022.
//

import SwiftUI

@main
struct sourceApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            HomeView(book: Locationse())
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
