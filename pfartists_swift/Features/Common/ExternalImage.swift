//
//  ExternalImage.swift
//  pfartists_swift
//
//  Created by Piotr prom on 2025/03/19.
//

import SwiftUI

struct ExternalImage: View {
  var type = "png"
  var pathImage = ""
  var width = 200.0
  var height = 200.0
//  print("Path found: \(path ?? "")")
  
    var body: some View {
      if let path = Bundle.main.path(forResource: pathImage, ofType: type),
      let imageData = try? Data(
          contentsOf: URL(fileURLWithPath: path)
         ),
      let dataProvider = CGDataProvider(data: imageData as CFData),
        let cgImage = CGImage(
          pngDataProviderSource: dataProvider,
          decode: nil,
          shouldInterpolate: true,
          intent: .defaultIntent
         ) {
           Image(decorative: cgImage, scale: 1.0)
             .resizable()
             .aspectRatio(contentMode: .fit)
             .frame(width: width, height: height)
             .clipShape(Capsule())
             .overlay(
               RoundedRectangle(cornerRadius: 12)
                 .stroke(Color("Pri"), lineWidth: 1) )
      } else {
             Text("Image not found")
               .foregroundColor(.red)
           }    }
}

#Preview {
    ExternalImage()
}
