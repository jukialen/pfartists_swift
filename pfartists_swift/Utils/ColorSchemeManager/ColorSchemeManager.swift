import SwiftUI

enum ColorSchemeOption: String, CaseIterable {
    case system
    case light
    case dark
}

class ColorSchemeManager: ObservableObject {
  @Published var selectedOption: ColorSchemeOption = .system
  
  func changeColor() {
    selectedOption = selectedOption == .light ? .dark : .light
  }
}
