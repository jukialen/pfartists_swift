import SwiftUI

struct ProviderButtons: View {  
  var provider_data: [ProviderType] {
    [
      ProviderType(iconName: "google_icon", colorName: "Google"),
      ProviderType(iconName: "spotify_icon", colorName: "Spotify"),
      ProviderType(iconName: "discord_icon", colorName: "Discord")
    ]
  }
  
    var body: some View {
      HStack(
        alignment: .center
      ) {
        ForEach(provider_data, id: \.iconName) { provider in
          VStack(spacing: 20) {
            Spacer()
            ProviderButton(
              icon_name: provider.iconName,
              color_name: provider.colorName
            )
            .padding()
            Spacer()
          }
        }
      }
      .frame(height: 40)
      .padding()
    }
}

#Preview {
    ProviderButtons()
}
