import SwiftUI

struct ProviderButton: View {
  var icon_name = ""
  var color_name = ""
  func login() {
    print("Button 1 clicked")
  }
  
    var body: some View {
      Button(action: {
        login()
      }) {
        Image(icon_name)
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .foregroundColor(Color(color_name))
      }
    }
}

#Preview {
    ProviderButtons()
}
