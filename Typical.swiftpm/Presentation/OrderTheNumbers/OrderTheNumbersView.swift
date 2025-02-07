//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

//import SwiftUI
//
//struct OrderTheNumbersView: View {
//
//    @State private var items = ["🍎 Apple", "🍌 Banana", "🍒 Cherry", "🍇 Grape", "🍉 Watermelon"]
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                ScrollView {
//                    LazyVStack {
//                        ForEach(items, id: \.self) { item in
//                            HStack {
//                                Image(systemName: "line.3.horizontal") // Ícone de arrastar
//                                    .foregroundColor(.gray)
//                                Text(item)
//                                    .padding()
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .background(Color(.systemGray6))
//                                    .cornerRadius(8)
//                            }
//                            .padding(.horizontal)
//                            .padding(.vertical, 4)
//                        }
//                        .onMove(perform: moveItem) // Permite reordenar os itens
//                    }
//                }
//            }
//            .navigationTitle("Reorder List")
//            .toolbar {
//                EditButton() // Ativa o modo de edição para reordenar
//            }
//        }
//    }
//
//    // Função para mover itens na lista
//    private func moveItem(from source: IndexSet, to destination: Int) {
//        items.move(fromOffsets: source, toOffset: destination)
//    }
//}
//
//struct ReorderableListView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderTheNumbersView()
//    }
//}

import SwiftUI

struct OrderTheNumbersView: View {
    @State private var items = ["🍎 Apple", "🍌 Banana", "🍒 Cherry", "🍇 Grape", "🍉 melon"]
    
    @State private var draggedItem: String? = nil
    @State var offset = 0.0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView {
                    LazyHStack(alignment: .bottom) {
                        ForEach(items, id: \.self) { item in
                            RowView(item: item, isBeingDragged: draggedItem == item)
                                .offset(x: draggedItem == item ? offset : 0)
                                .gesture(dragGesture(for: item)) // Detecta o arrastar

                        }
                    }
                    .frame(height: geo.size.height)
                }
            }
            .navigationTitle("Drag to Reorder")
        }
    }

    // MARK: - Função para mover os itens
    private func moveItem(from source: Int, to destination: Int) {
        guard source != destination else { return }
        let movedItem = items.remove(at: source)
        items.insert(movedItem, at: destination)
    }

    // MARK: - Gesture para arrastar
    private func dragGesture(for item: String) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                offset = value.translation.width

                if draggedItem == nil {
                    draggedItem = item
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred() // Feedback tátil
                }
            }
            .onEnded { value in
                if let draggedItem, let fromIndex = items.firstIndex(of: draggedItem) {
                    let offset = value.translation.width
                    let toIndex = fromIndex + Int(offset / 80) // Define a nova posição baseado na altura arrastada
                    
                    let validIndex = max(0, min(items.count - 1, toIndex)) // Garante que o índice esteja dentro dos limites
                    moveItem(from: fromIndex, to: validIndex)
                }
                draggedItem = nil
                self.offset = 0
            }
    }
}

// MARK: - Item da Lista
struct RowView: View {
    var item: String
    var isBeingDragged: Bool

    var body: some View {
        VStack {
            Text(item)
                .padding()
                .frame(maxHeight: .infinity, alignment: .leading)
                .background(isBeingDragged ? Color(.systemGray4) : Color(.darkGray))
                .cornerRadius(8)
                .scaleEffect(isBeingDragged ? 1.05 : 1.0) // Efeito ao arrastar
            
        }
        .zIndex(isBeingDragged ? 999 : 1)
        .padding(.vertical, 4)
        .animation(.spring(), value: isBeingDragged) // Suaviza a animação
    }
}

// MARK: - Preview
struct DragReorderableListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTheNumbersView()
    }
}
