import SwiftUI

/// A view model that handles validation for a specific input.
class RegLogFormsViewModel: ObservableObject {
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var emailError: String? = nil
  @Published var passwordError: String? = nil
  
  var client = SupClient().client
  
  var emptyValidationRule = EmptyValidationRule()
  var emailValidationRule = EmailValidationRule()
  var specialCharacterValidationRule = SpecialCharacterValidationRule()
  var hkikValidate = HKikValidate(fieldType: .password)

  func validateEmail() {
    let emptyError = emptyValidationRule.validate(email)
    let wrongEmail = emailValidationRule.validate(email)
    if (emptyError != nil) {
      emailError = emptyError
    } else if (wrongEmail != nil) {
      emailError = wrongEmail
    } else {
      emailError = nil
    }
  }

  func validatePassword() {
    let specError = specialCharacterValidationRule.validate(password)
    let hkiError = hkikValidate.validate(password)
    let minError = password.count < 9 ? "Form.validatePasswordNum" : nil
    let reqError = emptyValidationRule.validate(password)
    print("Errors")
    print(specError ?? "No Error")
    print(hkiError  ?? "No Error")
    print(minError ?? "No Error")
    print(reqError ?? "No Error")
    if (specError != nil) {
      passwordError = specError
    } else if (hkiError != nil) {
      passwordError = hkiError
    } else if (minError != nil) {
      passwordError = minError
    } else if (reqError != nil) {
      passwordError = reqError
    } else {
      emailError = nil // Wyczyszczenie błędu
    }
  }

  func validateForm() {
    validateEmail()
    validatePassword()
  }
  
  func registration() async {
//    validateForm()
    print("Registering with Email: \(email) and Password: \(password)")
    do {
      let user = try await client!.auth
        .signUp( email: email, password: password )
        .user
    print("user, \(user)")

    } catch {
      print(error.localizedDescription)
    }
  }
  
  @MainActor
  func login() async {
    let userState = UserState()

//    validateForm()
    print("Logging in with Email: \(email) and Password: \(password)")
    
    do {
      if let client = client {
        let user = try await client.auth
          .signIn( email: email, password: password )
        //          .user
        
        print("user, \(user)")
        userState.logIn()
      }
    } catch {
      print(error.localizedDescription)
    }
  }
}
