import SwiftUI

struct Welcome: View {
  @EnvironmentObject var colorSchemeManager: ColorSchemeManager
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Group {
          VStack {
            Text("title")
            Text("Witaj w świecie artystów")
          }
        }
          .frame(height: geometry.size.height * 0.9)
          .foregroundColor(.black)
        HStack() {
          Button(
            action: {colorSchemeManager.changeColor()}) {
              Image(
                systemName: colorSchemeManager.selectedOption == .dark ? "star.fill" : "moon.fill"
              )
              .foregroundColor(.black)
              .padding(32.0)
          }
          Spacer()
          NavigationLink(destination: Login()) {
            Image(systemName: "arrow.right")
              .padding(32.0)
              .foregroundColor(.black)
          }
        }
        .frame(
          width: geometry.size.width,
          height: geometry.size.height * 0.1
        )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color("Pri"))
    }
  }
}

#Preview {
    Welcome()
      .environmentObject(ColorSchemeManager())
}
