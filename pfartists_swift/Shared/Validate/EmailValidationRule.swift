import Foundation

/// A validation rule that checks if a string is a valid email address.
struct EmailValidationRule: ValidationRule {
    typealias Input = String
    
    let errorMessage: String
    
    /// Initializes the EmailValidationRule with a custom error message.
    /// - Parameter errorMessage: The message to display if validation fails.
    init(errorMessage: String = "Form.validateEmail") {
        self.errorMessage = errorMessage
    }
    
    func validate(_ input: String) -> String? {
        // Simple regex for demonstration purposes.
        let emailRegex = #"^\S+@\S+\.\S+$"#
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: input) ? nil : errorMessage
    }
}
