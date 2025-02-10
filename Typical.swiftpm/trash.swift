//
//  trash.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 09/02/25.
//



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
