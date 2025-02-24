import SwiftUI

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
                Text(viewModel.interpretation)
                    .padding()
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
    }
}
