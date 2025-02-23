import SwiftUI

struct CardBackView: View {
    
    let geo: GeometryProxy
    let widthPercent: CGFloat
    @ObservedObject var orderNumbersVm: OrderNumbersViewModel
    let card: NumberCard

    
    func isCorrectCardposition() -> Bool {
        if orderNumbersVm.numbersCards[card.id].id == card.id {
            return true
        }
        return false
    }
    
    var body: some View {
    
        VStack{
            Image(isCorrectCardposition() ? "correctIndicator" : "incorrectIndicator")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Image("cardNumberBg")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * widthPercent)

        }
    }
}
