

import SwiftUI
import PencilKit

struct ExploringAlphabetView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isSettingOpen = false
    @EnvironmentObject var coordinator: Coordinator
    
    var letterSelected: String  = "A"
    
    let alphabet: [String] = (65...90).map { String(UnicodeScalar($0)!) }
    
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
                    //Paint
                    ZStack {
                        Image(letterSelected + "Vazado")
                            .resizable()
                            .scaledToFit()
                            .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                        
                        PencilKitView()
                            .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                            .mask(
                                Image(letterSelected)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: calculatePercent(dimensionValue: 705, dimension: .width, geo: geo))
                                    .blendMode(.destinationOver)
                            )
                            .offset(y: 12)
                    }
                    
                    VStack{
                        ForEach(1 ..< 3) { number in
                            
                            Image(letterSelected + String(number) + "CardSound")
                                .resizable()
                                .scaledToFit()
                                .frame(width: calculatePercent(dimensionValue: 472, dimension: .width, geo: geo))
                        }
                    }
                    
                    
                }
                .offset(y: calculatePercent(dimensionValue: -50, dimension: .height, geo: geo))
                
                
                VStack{
                    Spacer()
                    ScrollView(.horizontal){
                        HStack(spacing: -4) {
                            ForEach(alphabet, id: \.self) { letter in
                                ZStack{
                                    Image("lettersBg")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(
                                            width: calculatePercent(dimensionValue: 190, dimension: .width, geo: geo)
//                                            height: calculatePercent(dimensionValue: 205, dimension: .height, geo: geo)
                                        )
                                    
                                    Text(letter)
                                        .font(.system(size: calculatePercent(dimensionValue: 150, dimension: .width, geo: geo), weight: .bold, design: .default))
                                        .foregroundStyle(Color.lightGreen)
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true})
                ])
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

