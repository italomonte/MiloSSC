

import SwiftUI



struct NumberCard: Identifiable, Equatable {
    var id: Int
    var heigthPercent: CGFloat
}


struct OrderNumbersView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var orderNumbersVm = OrderNumbersViewModel()
    @State var isSettingOpen = false

    
    @State private var draggedItem: NumberCard? = nil
    @State var offset = 0.0
    
    @State var isOrdered: Bool = false
    
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
                            .font(.patrickHandBigger)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(maxWidth: 0.713 * geo.size.width)
                        
                        HStack(alignment: .bottom) {
                            ForEach(orderNumbersVm.numbersCards, id: \.id) { item in
                                CardBackView(geo: geo, widthPercent: 0.089, orderNumbersVm: orderNumbersVm, card: item)
                            }
                        }
                        .frame(maxWidth: 0.9472 * geo.size.width, maxHeight: 0.76 * geo.size.height)
                    }
                    
                    
                    HStack(alignment: .bottom, spacing: 0.009 * geo.size.width) {
                        ForEach(orderNumbersVm.numbersCards, id: \.id) { card in
                            RowView(geo: geo, widthPercent: 0.086, item: card, isBeingDragged: draggedItem == card)
                                .offset(x: draggedItem == card ? offset : 0)
                                .gesture(dragGesture(for: card)) // Detecta o arrastar
                            
                        }
                    }
                    .frame(maxWidth: 0.9469 * geo.size.width, maxHeight: 0.76 * geo.size.height)
                    .offset(x: 1, y: 29)
                    
                    
                }
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: isOrdered) { oldValue, newValue in
            if isOrdered {
                coordinator.push(page: .OrderNumbersVictoryView)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    orderNumbersVm.shuffleCards()
                }
            }
        }
    }
    
    // MARK: - Função para mover os itens
    private func moveItem(from source: Int, to destination: Int) {
        guard source != destination else { return }
        let movedItem = orderNumbersVm.numbersCards.remove(at: source)
        orderNumbersVm.numbersCards.insert(movedItem, at: destination)
        isOrdered = orderNumbersVm.isOrdered()
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
                if let draggedItem, let fromIndex = orderNumbersVm.numbersCards.firstIndex(of: draggedItem) {
                    let offset = value.translation.width
                    let toIndex = fromIndex + Int(offset / 110) // Define a nova posição baseado na altura arrastada
                    
                    let validIndex = max(0, min(orderNumbersVm.numbersCards.count - 1, toIndex)) // Garante que o índice esteja dentro dos limites
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
        OrderNumbersView()
    }
}
