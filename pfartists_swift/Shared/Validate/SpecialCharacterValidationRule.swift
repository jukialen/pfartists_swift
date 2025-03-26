import Foundation

/// A validation rule that checks if a string contains at least one special character.
struct SpecialCharacterValidationRule: ValidationRule {
  typealias Input = String
  
  var fieldType: FormFieldType = .password
  let errorMessage: String
  
  /// Initializes the SpecialCharacterValidationRule with a custom error message.
  /// - Parameter errorMessage: The message to display if validation fails.
  init(fieldType: FormFieldType = .password) {
    self.fieldType = fieldType
    self.errorMessage = fieldType == .password
      ? "Form.validatePasswordSpec"
      : "Form.validateUsernameSpec"
   }
  
  func validate(_ input: String) -> String? {
    let specialCharacterRegex = #".*[#?!@$%^&*-].*"#
    let predicate = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex)
    return predicate.evaluate(with: input) ? nil : errorMessage
  }
}
