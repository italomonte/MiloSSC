

import SwiftUI



struct NumberCard: Identifiable, Equatable {
    var id: Int
    var heigthPercent: CGFloat
}

func getHeightPercent(for height: CGFloat) -> CGFloat {
    return height / 1620
}

struct OrderTheNumbersView: View {
    
     @EnvironmentObject var coordinator: Coordinator
    
    @State private var numbersCards: [NumberCard] = [
        NumberCard(id: 0, heigthPercent: getHeightPercent(for: 471)),
        NumberCard(id: 1, heigthPercent: getHeightPercent(for: 544)),
        NumberCard(id: 2, heigthPercent: getHeightPercent(for: 620)),
        NumberCard(id: 3, heigthPercent: getHeightPercent(for: 679)),
        NumberCard(id: 4, heigthPercent: getHeightPercent(for: 767)),
        NumberCard(id: 5, heigthPercent: getHeightPercent(for: 842)),
        NumberCard(id: 6, heigthPercent: getHeightPercent(for: 917)),
        NumberCard(id: 7, heigthPercent: getHeightPercent(for: 992)),
        NumberCard(id: 8, heigthPercent: getHeightPercent(for: 1065)),
        NumberCard(id: 9, heigthPercent: getHeightPercent(for: 1137)),
    ]
    
    @State private var draggedItem: NumberCard? = nil
    @State var offset = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("numbersBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Content
                
                ZStack (alignment: .bottom){
                    VStack {
                        
                        Text("Drag the fluffies into numerical order, from smallest to biggest. Colors and sizes can help you figure out the order.")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(maxWidth: 0.713 * geo.size.width)
                        
                        HStack(alignment: .bottom) {
                            ForEach(numbersCards, id: \.id) { item in
                                CardBackView(geo: geo, widthPercent: 0.089, isCorret: false)
                            }
                        }
                        .frame(maxWidth: 0.9472 * geo.size.width, maxHeight: 0.76 * geo.size.height)
                    }
                    
                    
                    HStack(alignment: .bottom, spacing: 0.009 * geo.size.width) {
                        ForEach(numbersCards, id: \.id) { card in
                            RowView(geo: geo, widthPercent: 0.086, item: card, isBeingDragged: draggedItem == card)
                                .offset(x: draggedItem == card ? offset : 0)
                                .gesture(dragGesture(for: card)) // Detecta o arrastar
                            
                        }
                    }
                    .frame(maxWidth: 0.9472 * geo.size.width, maxHeight: 0.76 * geo.size.height)
                    .offset(y: 27)
                    
                    
                }
                
                // UI
                VStack{
                    HStack {
                        Button {
                            coordinator.push(page: .MinigamesView)
                        } label: {
                            Image("CloseBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 0.08 * geo.size.width)
                        }
                        
                        Spacer()
                        
                        Button {
                            coordinator.push(page: .MinigamesView)
                        } label: {
                            Image("SettingsBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 0.08 * geo.size.width)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
    // MARK: - Função para mover os itens
    private func moveItem(from source: Int, to destination: Int) {
        guard source != destination else { return }
        let movedItem = numbersCards.remove(at: source)
        numbersCards.insert(movedItem, at: destination)
    }
    
    // MARK: - Gesture para arrastar
    private func dragGesture(for item: NumberCard) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                offset = value.translation.width
                
                if draggedItem == nil {
                    draggedItem = item
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred() // Feedback tátil
                }
            }
            .onEnded { value in
                if let draggedItem, let fromIndex = numbersCards.firstIndex(of: draggedItem) {
                    let offset = value.translation.width
                    let toIndex = fromIndex + Int(offset / 110) // Define a nova posição baseado na altura arrastada
                    
                    let validIndex = max(0, min(numbersCards.count - 1, toIndex)) // Garante que o índice esteja dentro dos limites
                    moveItem(from: fromIndex, to: validIndex)
                }
                draggedItem = nil
                self.offset = 0
            }
    }
}

// MARK: - Item da Lista
struct RowView: View {
    
    let geo: GeometryProxy
    var widthPercent: CGFloat
    var item: NumberCard
    var isBeingDragged: Bool

    var body: some View {
        VStack {
            Image("cardNumber" + String(item.id))
                .resizable()
                .frame(width: geo.size.width * widthPercent, height: geo.size.height * item.heigthPercent)
                .cornerRadius(8)
                .scaleEffect(isBeingDragged ? 1.05 : 1.0) // Efeito ao arrastar
        }
        .zIndex(isBeingDragged ? 999 : 1)
        .animation(.spring(), value: isBeingDragged) // Suaviza a animação
    }
}

// MARK: - Preview
struct DragReorderableListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTheNumbersView()
    }
}
