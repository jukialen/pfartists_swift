import SwiftUI

struct ProviderButtons: View {
  let provider_data = [
    "google": ["icon_name": "google_icon", "color_name": "Google"],
    "spotify": ["icon_name": "spotify_icon", "color_name": "Spotify"],
    "discord": ["icon_name": "discord_icon", "color_name": "Discord"]
  ]
  
    var body: some View {
      HStack(
        alignment: .center
      ) {
          ForEach(provider_data.keys.sorted(), id: \.self) { item in
            Spacer()
            ProviderButton(
              icon_name: provider_data[item]!["icon_name"]!,
              color_name: provider_data[item]!["color_name"]!
            )
            .padding()
          Spacer()
        }
      }
      .frame(height: 40)
      .padding()
    }
}

#Preview {
    ProviderButtons()
}
