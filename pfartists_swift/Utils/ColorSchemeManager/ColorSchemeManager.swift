import SwiftUI

enum ColorSchemeOption: String, CaseIterable {
    case system
    case light
    case dark
}

class ColorSchemeManager: ObservableObject {
    @Published var selectedOption: ColorSchemeOption = .system
    
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme
    
    var currentColorScheme: ColorScheme {
        switch selectedOption {
        case .system:
            return systemColorScheme
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
