
import SwiftUI

struct ImagePressable: View {
    
    var assets: [String]
    @State var pressed: Bool = false
    let width: CGFloat
    
    var body: some View {
        
        Image(assets[pressed ? 1 : 0])
            .resizable()
            .scaledToFit()
            .frame(width: width)
            .onTapGesture {
                pressed.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    pressed.toggle()
                }
            }
            
        
    }
}
