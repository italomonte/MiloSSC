
import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    var normalImage: String
    var pressedImage: String
    var width: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        Image(configuration.isPressed ? pressedImage : normalImage)
            .resizable()
            .scaledToFit()
            .frame(width: width) // Ajuste conforme necessário
    }
}
