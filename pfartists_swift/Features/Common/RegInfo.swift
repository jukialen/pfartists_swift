import SwiftUI
import Foundation


struct RegInfo: View {
  @StateObject private var viewModel = LoginViewModel()
  
  private func makeLocalizedAttributedString() -> AttributedString {
    let termsLink = "\(viewModel.siteUrl)\(Locale.current.language.languageCode?.identifier ?? "en")/terms"
    
    let privacyLink = "\(viewModel.siteUrl)\(Locale.current.language.languageCode?.identifier ?? "en")/privacy"
    
    var string = AttributedString(NSLocalizedString("Form.acceptInfoOne", comment: ""))

    if let termsURL = URL(string: termsLink) {
      var termsLink = AttributedString(NSLocalizedString("Form.acceptInfoTwo", comment: ""))
      termsLink.link = termsURL
      termsLink.foregroundColor = .blue
      termsLink.underlineStyle = .single
      string.append(termsLink)
    }

    string.append(AttributedString(NSLocalizedString("Form.acceptInfoThree", comment: "")))

    if let privacyURL = URL(string: privacyLink) {
      var privacyLink = AttributedString(NSLocalizedString("Form.acceptInfoFour", comment: ""))
      privacyLink.link = privacyURL
      privacyLink.foregroundColor = .blue
      privacyLink.underlineStyle = .single
      string.append(privacyLink)
    }

    string.append(AttributedString("."))
    return string
  }
  
  var body: some View {
    HStack {
      Text(makeLocalizedAttributedString())
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .top])
    }
    .frame(height: 300)
    
  }
}
 
