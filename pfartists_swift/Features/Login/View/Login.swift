import SwiftUI
import GoogleSignIn
import Foundation

struct Login: View {
  @State private var showForgottenSheet = false
  var supClient = SupClient()

  
  var body: some View {
      GeometryReader { geometry in
        VStack {
          RegLogForms(regBool: false)

          Button(action: { showForgottenSheet.toggle() }) {
            Text("Form.forgottenPasswordLink")
          }
          .padding()
          .foregroundStyle(Color("Third"))
          .foregroundColor(.black)
          .clipShape(Capsule())
          .sheet(isPresented: $showForgottenSheet) {
            Forgotten()
          }
          .frame(height: geometry.size.height * 0.08)
          RegInfo()
            .frame(height: geometry.size.height * 0.08)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(Text("Form.titleOfLogin"))
        .onOpenURL { url in
            GIDSignIn.sharedInstance.handle(url)
        }
      }
    }
}

#Preview {
    Login()
}
