//
//  SignUp.swift
//  pfartists_swift
//
//  Created by Piotr prom on 2025/03/05.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
      VStack {
        TextField("email", text: $email)
  //        .focused($emailFieldIsFocused)
              .onSubmit {
                validate()
              }
              .textInputAutocapitalization(.never)
              .disableAutocorrection(true)
              .border(.secondary)
        TextField("password", text: $password)
  //        .focused($emailFieldIsFocused)
  //            .onSubmit {
  //              validate(name: email)
  //            }
              .textInputAutocapitalization(.never)
              .disableAutocorrection(true)
              .border(.secondary)
      }
    }
}

#Preview {
    SignUp()
}
