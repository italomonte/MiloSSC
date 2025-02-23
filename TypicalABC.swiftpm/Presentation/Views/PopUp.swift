import SwiftUI

struct StyledPopup: View {
    @State private var toggles = [false, false, false]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader{ geo in
//            ZStack {
//                Color.black.opacity(0.5)
//                    .ignoresSafeArea()
//                
//                ZStack{
//                    Image("poopUpBg")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: calculatePercent(dimensionValue: 794, dimension: .width, geo: geo))
//                    
//                    VStack{
//                        Text("Settings")
//                            .font(.system(size: 45, weight: .bold, design: .default))
//                            .fontWeight(.bold)
//                            .padding(.top, 165)
//                        
//                        
//                        VStack() {
//                            HStack (spacing: 56){
//                                Image("settingsMSC")
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .frame(maxHeight: .infinity, alignment: .center)
//                                    .offset(x: -30)
//                                Text("Background music")
//                                    .font(.system(size: 25, weight: .medium, design: .default))
//                                Spacer()
//                                Image("settingsToggleTrue")
//                            }
//                            .padding([.leading, .trailing], 76)
//                            .padding(.top, 52)
//                            
//                            HStack (spacing: 56){
//                                Image("settingsSEF")
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .frame(maxHeight: .infinity, alignment: .center)
//                                    .offset(x: -30)
//                                Text("Sound effects")
//                                    .font(.system(size: 25, weight: .medium, design: .default))
//                                Spacer()
//                                Image("settingsToggleTrue")
//                            }
//                            .padding([.leading, .trailing], 76)
//                            .padding(.top, 42)
//                            
//                            HStack (spacing: 56){
//                                Image("settingsFilter")
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .frame(maxHeight: .infinity, alignment: .center)
//                                    .offset(x: -30)
//                                Text("Color filter")
//                                    .font(.system(size: 25, weight: .medium, design: .default))
//                                Spacer()
//                                Image("settingsToggleTrue")
//                            }
//                            .padding([.leading, .trailing], 76)                }
//                        
//                        Spacer()
//                    }
//                    .frame(width: 794, height: 781)
//                    .background(Image("BacckgroundPopUp"))
//                    .cornerRadius(20)
//                    .overlay(
//                        Button(action: {
//                            presentationMode.wrappedValue.dismiss()
//                        }) {
//                            Image("CloseBtn")
//                                .resizable()
//                                .frame(width: 128, height: 142)
//                        }
//                            .offset(x: -794/2.3 + 33 + 15, y: -781/2.4 + 135)
//                    )
//                }
//            }
        }
    }
}

