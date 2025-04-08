import SwiftUI
struct HexagramCardView: View {
    let mainHexagram: Hexagram
    let transformedHexagram: Hexagram?
    let interpretation: String

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Spacer()
                VStack{
                    Text("主卦")
                        .font(.headline)
                        .bold()
                    
                    Text(mainHexagram.name)
                        .font(.title2)
                        .bold()
                    
                    Text(mainHexagram.hexagram) // Display Hexagram Symbol
                        .font(.largeTitle)
                    
                }
                
                Spacer()
                
                if let transformed = transformedHexagram {
                    VStack {
                        Text("变卦")
                            .font(.headline)
                            .bold()
                        Text(transformed.name)
                            .font(.title2)
                            .bold()
                        Text(transformed.hexagram)
                            .font(.largeTitle)
                        
                    }
                }else {
                        Text("无变卦") // No Transformed Hexagram
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                Spacer()
                
            }.padding(30)
            
            
            Divider() // Nice separator line
            
            // AI 解读
            Text("AI 解读")
                .font(.headline)
                .bold()
            ScrollView {
                Text(interpretation)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(radius: 5))
        .padding(.horizontal)
    }
}

struct HexagramView: View {
    @StateObject private var viewModel = HexagramViewModel()
    @State var question: String = ""
    @FocusState private var isTextFieldFocused: Bool // Tracks focus state

    var body: some View {
        VStack(spacing: 20) {
            Text("赛博梅花易数")
                .font(.title)
            
            TextField("请输入你此时的疑惑：",  text: $question)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .focused($isTextFieldFocused)
            
            Button("询问AI神棍") {
                viewModel.generateHexagramFromLunarDate(question: question)
                isTextFieldFocused = false  // 关闭键盘
            }
            .padding()
            
            
            if viewModel.isLoading {
                ProgressView("正在询问 AI 神棍...")
                    .padding()
            }
            
            if !viewModel.interpretation.isEmpty && !viewModel.isLoading {
                HexagramCardView(mainHexagram: viewModel.selectedHexagram!, transformedHexagram: viewModel.transformedHexagram, interpretation: viewModel.interpretation)
                .padding()
            }
        }
        .padding()
    }
}
