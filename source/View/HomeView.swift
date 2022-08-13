//
//  HomeView.swift
//  source
//
//  Created by Bouchedoub Rmazi on 13/8/2022.
//

import SwiftUI

struct HomeView: View {
    let book : Locationse
    @State private var selection: Int = 1
    
    
    var body: some View {
        TabView {
            
            ContentView( book: book)
                .tabItem {
                    Image(systemName: "house.fill")
                                Text("Home")
                            }
                .background(Color.red)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                                        Text("Profile")
                            }
            }
             .background(Color.red)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(book:  Locationse())
    }
}
