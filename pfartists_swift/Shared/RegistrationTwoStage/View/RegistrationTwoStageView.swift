import SwiftUI
import PhotosUI

struct RegistrationTwoStageView: View {
  @StateObject private var registrationTwoStageViewModel = RegistrationTwoStageViewModel()
  @FocusState private var focusedField: RegistrationTwoStageModel?
  
  @State private var selectedItem: PhotosPickerItem? = nil
  @State private var selectedImage: Image? = nil
  
  var body: some View {
    GeometryReader { geometry in
      Text("NewUser.title")
      Form {
        TextField(
          "NewUser.name",
          text: Binding(
            get: { registrationTwoStageViewModel.username ?? "" },
            set: { registrationTwoStageViewModel.username = $0 }
          )
        )
        .focused($focusedField, equals: .username)
        .onSubmit { focusedField = .username }
        .onChange(
          of: registrationTwoStageViewModel.username
        ) { oldValue, newValue in
//            registrationTwoStage.validateUsername()
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
        TextField(
          "pseudonym",
          text: $registrationTwoStageViewModel.pseudonym
        )
        .focused($focusedField, equals: .pseudonym)
        .onSubmit { focusedField = .pseudonym }
        .onChange(
          of: registrationTwoStageViewModel.pseudonym
        ) { oldValue, newValue in
//            registrationTwoStage.validatePseudonym()
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
        ZStack(alignment: .topLeading) {
          if registrationTwoStageViewModel.description.isEmpty {
            Text("description")
              .foregroundColor(.gray.opacity(0.6))
              .padding(.leading, 15)
              .padding(.top, 12)
          }
          TextEditor(
            text: $registrationTwoStageViewModel.description
          )
            .focused($focusedField, equals: .description)
            .onSubmit { focusedField = .description }
            .onChange(
              of: registrationTwoStageViewModel.description
              ) { oldValue, newValue in
    //            registrationTwoStage.validateUsername()
              }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .frame(width: geometry.size.width * 0.8, height: 200)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .border(Color.gray, width: 1)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color("Pri"), lineWidth: 1)
            )
        }
          .padding()
        
        FileOptionsMenuView()
      }
    }
  }
}

#Preview {
    RegistrationTwoStageView()
}
