//
//  start.swift
//  pfartists_swift
//
//  Created by Piotr prom on 2025/02/24.
//

import SwiftUI

struct Start: View {
    var text = "Hello, World!";
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Settings()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("profile")
                    
                }
        }
    }
}
