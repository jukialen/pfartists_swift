import SwiftUI

@main
struct pfartists_swiftApp: App {
  @StateObject private var colorSchemeManager = ColorSchemeManager()
  @StateObject private var userState = UserState()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(colorSchemeManager)
        .environmentObject(userState)
    }
  }
}
