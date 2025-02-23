import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                ScrollView {
                    VStack{
                        
                        Image("infoTitle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: calculatePercent(dimensionValue: 383, dimension: .width, geo: geo))
                            .padding(.bottom, 32)
                        
                        Image("infoContent")
                            .resizable()
                            .scaledToFill()
                        
                        
                    }
                    .padding(.horizontal)
                }.scrollIndicators(.hidden)
                
                VStack{
                    
                    HStack (spacing: 20){
                        Button {
                            dismiss()
                            audioManager.sounds.first(where: { $0.filename == .genericFeedback})?.player?.play()

                        }
                        label: { }
                            .buttonStyle(PressableButtonStyle(normalImage: "PassLeftBtn", pressedImage: "PassLeftBtnPressed", width: calculatePercent(dimensionValue: 174, dimension: .width, geo: geo)))
                        
                        Text("Back")
                            .font(.patrickHandBigger)
                            .foregroundStyle(Color.darkBrown)
                        
                        Spacer()
                        
                    }
                    Spacer()
                }.padding()
            }
            .padding(.horizontal)
        }.navigationBarBackButtonHidden(true)
    }
}


