import SwiftUI

struct InitialMenu: View {
    var body: some View {
        NavigationStack{
            VStack {
               
                Text("Typical")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink {
                    AboutView()
                } label: {
                    Text("About View")
                }
                
                
                NavigationLink {
                    HistoryView()
                } label: {
                    Text("History View")
                }

            }
        }
        
    }
}
