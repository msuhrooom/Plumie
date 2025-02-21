import Foundation

struct Hexagram: Identifiable {
    let id = UUID()
    let name: String      // Hexagram name
    let hexagram: String  // Unicode symbol
    let guaYao: String    // 卦爻 explanation
    let wanWuLeiXiang: String  // 万物类象 (symbolic meanings)
}
