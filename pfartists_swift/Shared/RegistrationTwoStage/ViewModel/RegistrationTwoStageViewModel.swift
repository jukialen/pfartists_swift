import SwiftUI

class RegistrationTwoStageViewModel: ObservableObject {
  @Published var username: String?
  @Published var pseudonym: String = ""
  @Published var description: String = ""
  @Published var profilePhoto: String?


  var client = SupClient().client
  
  
  func isSupportedFormat(data: Data) -> Bool {
    let imageFormat = UIImage(data: data)?.imageAsset?.value(forKey: "type") as? String
    return imageFormat == "public.png" || imageFormat == "public.heic" || imageFormat == "public.jpeg" || imageFormat == "public.jpg" || imageFormat == "public.webp" || imageFormat == "public.avif"
  }
}
