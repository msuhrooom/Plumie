import SwiftUI

struct HexagramView: View {
    @StateObject private var viewModel = HexagramViewModel()
    @State var question: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hexagram for NOW")
                .font(.title)
            
            TextField("Enter your question",  text: $question)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

            Button("Generate") {
                viewModel.generateHexagramFromLunarDate()
            }

            if let hexagram = viewModel.selectedHexagram {
                VStack {
                    Text("卦名: \(hexagram.name)").font(.headline)
                    Text("卦象: \(hexagram.hexagram)").font(.largeTitle)
                    Text("卦爻: \(hexagram.guaYao)").padding()
                }
                .padding()
            }
        }
        .padding()
    }
}


