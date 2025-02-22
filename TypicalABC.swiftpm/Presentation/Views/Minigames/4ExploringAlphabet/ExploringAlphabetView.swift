

import SwiftUI
import PencilKit


struct ExploringAlphabetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isSettingOpen = false
    @EnvironmentObject var coordinator: Coordinator
    
    @State var letterSelected: Int  = 65
    @State var canvasPencilView: PKCanvasView = PKCanvasView()
    @State private var isOnLetterPainted = false
    @ObservedObject var alphabetVm = AlphabetViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("alphabetBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Image("symbolsBgAlphabet")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: calculatePercent(dimensionValue: 2090, dimension: .width, geo: geo))
                    .offset(y: calculatePercent(dimensionValue: -100, dimension: .height, geo: geo))
                
                // Content
                HStack (spacing: 25){
                    // Paint
                    ZStack {
                        Image(String(UnicodeScalar(letterSelected) ?? "A") + "Vazado")
                            .resizable()
                            .scaledToFit()
                            .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                        
                        
                        PencilKitView(canvasPencilView: canvasPencilView)
                            .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                            .mask(
                                Image(String(UnicodeScalar(letterSelected) ?? "A"))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: calculatePercent(dimensionValue: alphabetVm.alphabet[letterSelected - 65].widthPercent, dimension: .width, geo: geo))
                                    .blendMode(.destinationOver)
                            )
                            .offset(
                                x: alphabetVm.alphabet[letterSelected - 65].offset.width,
                                y: alphabetVm.alphabet[letterSelected - 65].offset.height
                            )
                        
                        Image(String(UnicodeScalar(letterSelected) ?? "A") + "Direction")
                            .resizable()
                            .scaledToFit()
                            .frame(width: calculatePercent(
                                dimensionValue: alphabetVm.alphabet[letterSelected - 65].directionPercent, dimension: .width, geo: geo)
                            )
                            .allowsHitTesting(false)
                            .offset(y: alphabetVm.alphabet[letterSelected - 65].directionOffset)
                        
                        VStack{
                            HStack{
                                Button {canvasPencilView.drawing = PKDrawing()}
                                label: { }
                                    .buttonStyle(PressableButtonStyle(normalImage: "ResetBtn", pressedImage: "ResetBtnPressed", width: calculatePercent(dimensionValue: 120, dimension: .width, geo: geo)))
                                
                                Spacer()
                                
                                Button {
                                    alphabetVm.alphabet[letterSelected - 65].done = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        if (alphabetVm.alphabet[0].done && alphabetVm.alphabet[1].done && alphabetVm.alphabet[2].done){
                                            coordinator.push(page: .ExploringTheAlphabetVictoryView)
                                        }
                                    }
                                }
                                label: { }
                                    .buttonStyle(PressableButtonStyle(normalImage: "CheckBtn", pressedImage: "CheckBtnPressed", width: calculatePercent(dimensionValue: 120, dimension: .width, geo: geo)))
                                
                            }.padding()
                            Spacer()

                        }
                        .padding()
                        .frame(
                            width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo),
                            height: calculatePercent(dimensionValue: 1100, dimension: .height, geo: geo)
                        )
                        
                        VStack{
                            Spacer()

                            HStack{
                                Spacer()

                                
                                
                            }.padding()

                        }
                        .padding()
                        .frame(
                            width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo),
                            height: calculatePercent(dimensionValue: 1100, dimension: .height, geo: geo)
                        )

                        
                    }
                    
                    // Examples
                    VStack{
                        ForEach(1 ..< 3) { number in
                            Image(String(UnicodeScalar(letterSelected) ?? "A") + String(number) + "CardSound")
                                .resizable()
                                .scaledToFit()
                                .frame(width: calculatePercent(dimensionValue: 472, dimension: .width, geo: geo))
                        }
                    }
                    
                }
                .offset(y: calculatePercent(dimensionValue: -50, dimension: .height, geo: geo))
                
                // Scroll Alphabet
                VStack{
                    Spacer()
                    ScrollView(.horizontal){
                        HStack(spacing: -1) {
                            ForEach(alphabetVm.alphabet) { letter in
                                LetterCard(letter: letter, geo: geo, letterSelected: $letterSelected)
                                    .onTapGesture {
                                        if letter.id >= 65 && letter.id <= 67 {
                                            alphabetVm.alphabet[letterSelected - 65].drawning = canvasPencilView.drawing
                                            letterSelected = letter.id
                                            
                                            if !letter.done {
                                                alphabetVm.alphabet[letter.id - 65].drawning = PKDrawing()
                                            }
                                            
                                            canvasPencilView.drawing = alphabetVm.alphabet[letterSelected - 65].drawning


                                        }
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom)
                }
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

