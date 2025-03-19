import SwiftUI

struct SignUp: View {
    var body: some View {
      VStack {
        RegLogForms()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .navigationTitle(Text("Form.titleOfRegistration"))
    }
}

#Preview {
    SignUp()
}
