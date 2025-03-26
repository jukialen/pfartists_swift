/// A validation rule that checks if a string is not empty.
struct EmptyValidationRule: ValidationRule {
  typealias Input = String
  
  let errorMessage: String
  
  /// Initializes the EmptyValidationRule with a custom error message.
  /// - Parameter errorMessage: The message to display if validation fails.
  init(errorMessage: String = "Form.validateRequired") {
    self.errorMessage = errorMessage
  }
  
  func validate(_ input: String) -> String? {
    return input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? errorMessage : nil
  }
}
