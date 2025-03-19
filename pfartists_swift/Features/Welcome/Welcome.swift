import SwiftUI

struct Welcome: View {
  @EnvironmentObject var colorSchemeManager: ColorSchemeManager
  
  func testPAth() {
    if let path = Bundle.main.path(forResource: "Resources/AppIcon/PfA", ofType: "png") {
        print("Path exists: \(path)")
    } else {
        print("Path not found")
    }
  }

  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        ExternalImage(
          pathImage: "PfA",
          width: geometry.size.width * 0.65,
          height: geometry.size.width * 0.65
        )
        .padding(.top)

        Group {
          VStack {
            Text("title")
              .font(.title)
            Text("Witaj w świecie artystów")
              .font(.title3)
          }
        }
        .frame(
          width: geometry.size.width * 0.8,
          height: geometry.size.height * 0.4
//          alignment: .center
        )
          .foregroundStyle(.black)
//          Button(
//            action: {colorSchemeManager.changeColor()}) {
//              Image(
//                systemName: colorSchemeManager.selectedOption == .dark ? "star.fill" : "moon.fill"
//              )
//              .foregroundColor(.black)
//              .padding(32.0)
//          }
          NavigationLink(destination: SignUp()) {
            Text("Nav.signUp")
              .frame(maxWidth: geometry.size.width * 0.8)
              .padding()
              .background(
                  Capsule()
                    .stroke(Color("Sec"), lineWidth: 2)
              )
            .foregroundColor(.black)
          }
          .padding()
          .clipShape(Capsule())
          NavigationLink(destination: Login()) {
            Text("Nav.signIn")
              .frame(maxWidth: geometry.size.width * 0.8)
              .padding()
              .background(
                  Capsule()
                    .stroke(Color("Sec"), lineWidth: 2)
              )
            .foregroundColor(.black)
          }
          .background(Color("Sec"))
          .clipShape(Capsule())
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
