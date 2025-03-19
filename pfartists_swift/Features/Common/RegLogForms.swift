import SwiftUI
import Foundation

struct RegLogForms: View {
  @State private var email: String = ""
  @State private var password: String = ""
  @FocusState private var emailFieldIsFocused: Bool
  @State private var isPasswordHidden: Bool = true

  var regBool: Bool = true
  
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        VStack(alignment: .center, spacing: 20) {
          TextField("Form.email", text: $email)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .frame(width: geometry.size.width * 0.8, height: 60)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("Pri"), lineWidth: 1)
            )
          ZStack(alignment: .trailing) {
            if isPasswordHidden {
              SecureField("Form.password", text: $password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: geometry.size.width * 0.8, height: 60)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                .overlay(
                  RoundedRectangle (cornerRadius: 12)
                    .stroke(Color("Pri"), lineWidth: 1)
                )
            } else {
              TextField("Form.password", text: $password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .frame(width: geometry.size.width * 0.8, height: 60)
                .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("Pri"), lineWidth: 1)
                )
            }
            Button(action: { isPasswordHidden.toggle() }) {
              Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                .foregroundStyle(Color("Sec"))
                .padding(.trailing, 18)
            }
          }
          Button(action: validate) {
            Text(regBool == false ?  "Form.loginSubmit" : "Form.createSubmit")
//              .frame(height: 400)
              .frame(maxWidth: geometry.size.width * 0.8)
              .foregroundStyle(Color.black)
              .padding()
              .background(
                  Capsule()
                    .stroke(Color("Sec"), lineWidth: 2)
              )
          }
          .frame(
            maxWidth: geometry.size.width * 0.8,
            maxHeight: 40
          )
          .background(Color("Sec"))
          .clipShape(Capsule())
          .padding(.vertical, 10)
        }
        .frame(
          width: geometry.size.width * 0.9,
         height: geometry.size.height * 0.5
        )
        .padding(.horizontal, 20)
//        .background(.green)
        VStack (alignment: .center, spacing: 0) {
          Text(regBool == false ? "Form.providerTitleLogin" : "Form.providerTitleRegistration")
            .font(.headline)
            .padding(.bottom, 30)
          ProviderButtons()
        }
        .frame(
          width: geometry.size.width,
               height: geometry.size.height * 0.3
        )
//        .background(.blue)
      }
      .frame(height: geometry.size.height)
      .scrollContentBackground(.hidden)
    }
  }
}

#Preview {
    RegLogForms()
}
