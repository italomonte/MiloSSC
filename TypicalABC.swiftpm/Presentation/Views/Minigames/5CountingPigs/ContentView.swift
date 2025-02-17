import SwiftUI

struct ContentView: View {
    let image: UIImage = UIImage(named: "four") ?? UIImage(systemName: "circle")!
    
    let classifier = MNISTClassifierHandler()
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("\(classifier?.classify(image: image) ?? "Unknown")")
        }
    }
}
