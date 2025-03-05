import SwiftUI

struct ContentView: View {
  @EnvironmentObject var userState: UserState
  @EnvironmentObject var colorSchemeManager: ColorSchemeManager
  @Environment(\.colorScheme) private var systemColorScheme: ColorScheme

  var currentColorScheme: ColorScheme {
    switch colorSchemeManager.selectedOption {
      case .system:
          return systemColorScheme
      case .light:
          return .light
      case .dark:
          return .dark
      }
  }
  
  var body: some View {
    NavigationView {
      if userState.isLoggedIn {
        Start()
          .preferredColorScheme(currentColorScheme)
      } else {
        Welcome()
          .preferredColorScheme(currentColorScheme)
      }
    }
  }
}

#Preview {
    ContentView()
    .environmentObject(UserState())
    .environmentObject(ColorSchemeManager())
}
