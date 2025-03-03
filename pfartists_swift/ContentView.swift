//
//  ContentView.swift
//  pfartists_swift
//
//  Created by Piotr prom on 2025/02/24.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var userState: UserState
  
  var body: some View {
    if userState.isLoggedIn {
      Start()
    } else {
      Welcome()
    }
  }
}

#Preview {
    ContentView()
}
