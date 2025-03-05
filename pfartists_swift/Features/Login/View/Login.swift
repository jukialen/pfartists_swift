import SwiftUI

struct Login: View {
  @State private var email: String = ""
  @State private var password: String = ""
   private var emailFieldIsFocused: Bool = false
  
  @State private var showSheet = false
  func validate () {
    print(email, password)
  }
  
  var body: some View {
    VStack {
      Button("registration"){
        showSheet.toggle()
      }
      .padding()
      .background(Color("Third"))
      .foregroundColor(.black)
      .cornerRadius(10)
    }.sheet(isPresented: $showSheet) {
      SignUp()
    }
    .navigationTitle("Login")
}
}
#Preview {
    Login()
}
