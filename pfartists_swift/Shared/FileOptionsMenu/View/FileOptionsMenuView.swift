import SwiftUI
import UniformTypeIdentifiers

struct FileOptionsMenuView: View {
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var showDocumentPicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var selectedFileURL: URL?

    var body: some View {
        VStack {
            Button("profilePhoto") {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                  title: Text("NewFile.fileTitle"),
                  buttons: [
                        .default(Text("Take a Photo")) {
                            sourceType = .camera
                            showImagePicker = true
                        },
                        .default(Text("Choose from Gallery")) {
                            sourceType = .photoLibrary
                            showImagePicker = true
                        },
                        .default(Text("chooseFile")) {
                            showDocumentPicker = true
                        },
                        .cancel()
                    ]
                )
            }
            
            if let selectedFileURL = selectedFileURL {
                Text("Selected file: \(selectedFileURL.lastPathComponent)")
            }

            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: sourceType, selectedImage: $selectedImage)
        }
        .fileImporter(
            isPresented: $showDocumentPicker,
            allowedContentTypes: [UTType.png, UTType.jpeg, UTType.heic],
            allowsMultipleSelection: false
        ) { result in
            do {
                let fileURL = try result.get().first
                selectedFileURL = fileURL
            } catch {
                print("Error selecting file: \(error.localizedDescription)")
            }
        }
    }
}
