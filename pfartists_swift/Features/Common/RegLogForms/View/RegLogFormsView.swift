import SwiftUI
import Foundation

struct RegLogForms: View {
  @State private var isPasswordHidden: Bool = true
  @State private var showFullScreenCover: Bool = false
  
  @StateObject private var regLogFormsViewModel = RegLogFormsViewModel()
  @FocusState private var focusedField: Field?
  
  var regBool: Bool = true
    
  func submit() async {
    await regBool == true ? showFullScreenCover = regBool : regLogFormsViewModel
      .login()
  }
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        VStack(alignment: .center, spacing: 20) {
          VStack(alignment: .leading, spacing: 5) {
            TextField(
              "Form.email",
              text: $regLogFormsViewModel.email
            )
            .focused($focusedField, equals: .email)
            .onSubmit { focusedField = .email }
            .onChange(
              of: regLogFormsViewModel.email
            ) { oldValue, newValue in
              regLogFormsViewModel.validateEmail()
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .frame(width: geometry.size.width * 0.8, height: 60)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("Pri"), lineWidth: 1)
            )
            if let emailError = regLogFormsViewModel.emailError {
              Text(NSLocalizedString(emailError, comment: ""))
                .foregroundColor(.red)
                .font(.caption)
                .frame(maxWidth: geometry.size.width * 0.6)
            }
          }
          ZStack(alignment: .trailing) {
            VStack(alignment: .leading, spacing: 5) {
              if isPasswordHidden {
                SecureField("Form.password", text: $regLogFormsViewModel.password)
                  .focused($focusedField, equals: .password)
                  .onSubmit { focusedField = .password }
                  .onChange(
                    of: regLogFormsViewModel.password
                  ) { oldValue, newValue in
                    regLogFormsViewModel.validatePassword()
                  }
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
                TextField("Form.password", text: $regLogFormsViewModel.password)
                  .focused($focusedField, equals: .password)
                  .onSubmit { focusedField = .password }
                  .onChange(
                    of: regLogFormsViewModel.password
                  ) { oldValue, newValue in
                    regLogFormsViewModel.validatePassword()
                  }
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
              Text(regLogFormsViewModel.passwordError ?? "")
                  .foregroundColor(.red)
                  .font(.caption)
//                  .frame(minWidth: 5)
//                  .frame(maxHeight: 32)
            }
            Button(action: { isPasswordHidden.toggle() }) {
              Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                .foregroundStyle(Color("Sec"))
                .padding(.trailing, 18)
                .padding(.top, -16)
            }
          }
          Button(action: {
            Task {
              await submit()
            }
          }) {
            Text(regBool == false ?  "Form.loginSubmit" : "Form.createSubmit")
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
          .padding(.top, -8)
//          .fullScreenCover(isPresented: $showFullScreenCover) {
//              Cos()
//          }
        }
        .frame(
          width: geometry.size.width * 0.9,
         height: geometry.size.height * 0.5
        )
        .padding(.horizontal, 20)
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
      }
      .frame(height: geometry.size.height)
      .scrollContentBackground(.hidden)
    }
  }
}

#Preview {
    RegLogForms()
}
