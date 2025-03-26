import Foundation

enum FormFieldType {
  case password
  case pseudonym
  case username
}
/// A validation rule that checks if a string contains at least one special character.
struct HKikValidate: ValidationRule {
  typealias Input = String
  
  var fieldType: FormFieldType
  let errorMessage: String
  
  /// Initializes the SpecialCharacterValidationRule with a custom error message.
  /// - Parameter errorMessage: The message to display if validation fails.
  init(fieldType: FormFieldType = .password) {
    self.fieldType = fieldType
    switch fieldType {
      case .username:
        self.errorMessage = "Form.validateUsernameHKik"
        break
      case .pseudonym:
        self.errorMessage = "Form.validatePseudonymHKik"
        break
      case .password:
        self.errorMessage = "Form.validatePasswordHKik"
        break
    }
  }
  
  func validate(_ input: String) -> String? {
    let hkikCharacterRegex = #".*[a-ząćęłńóśźżĄĘŁŃÓŚŹŻぁ-んァ-ヾ一-龯].*"#
    let predicate = NSPredicate(format: "SELF MATCHES %@", hkikCharacterRegex)
    return predicate.evaluate(with: input) ? nil : errorMessage
  }
}
