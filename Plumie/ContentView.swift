import SwiftUI

struct ContentView: View {
    @State private var question: String = ""
    @State private var resultText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("What is in your mind rn: ", text: $question)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit") {
                let now = Date()
                let (upper, lower, line) = generateMeihuaGua(from: now)
                
                // Map to trigram names
                let upperName = guaName(for: upper)
                let lowerName = guaName(for: lower)
                
                // Build a display string (example)
                resultText = """
                Concern：\(question)
                Upper Trigram：\(upperName)（\(upper)）
                Lower Trigram：\(lowerName)（\(lower)）
                动爻：\(line)
                Submition Time：\(now)
                """
            }
            
            Text(resultText)
                .padding()
        }
        .padding()
    }
    
    func generateMeihuaGua(from date: Date) -> (upper: Int, lower: Int, changingLine: Int) {
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        // 1) 上卦
        var upper = (year + month + day) % 8
        upper = (upper == 0) ? 8 : upper
        
        // 2) 下卦
        var lower = (hour + minute) % 8
        lower = (lower == 0) ? 8 : lower
        
        // 3) 动爻
        var changingLine = (year + month + day + hour + minute) % 6
        changingLine = (changingLine == 0) ? 6 : changingLine
        
        return (upper, lower, changingLine)
    }
    
    func guaName(for index: Int) -> String {
        switch index {
        case 1: return "乾"
        case 2: return "兑"
        case 3: return "离"
        case 4: return "震"
        case 5: return "巽"
        case 6: return "坎"
        case 7: return "艮"
        case 8: return "坤"
        default: return "未知"
        }
    }
    
    let hexagramMapping: [String: (name: String, hexagram: String)] = [
        "11": ("乾为天", "䷀"), "12": ("天泽履", "䷉"), "13": ("天火同人", "䷌"), "14": ("天雷无妄", "䷘"),
        "15": ("天风姤", "䷫"), "16": ("天水讼", "䷅"), "17": ("天山遁", "䷠"), "18": ("天地否", "䷋"),
        "21": ("泽天夬", "䷪"), "22": ("兑为泽", "䷹"), "23": ("泽火革", "䷰"), "24": ("泽雷随", "䷐"),
        "25": ("泽风大过", "䷛"), "26": ("泽水困", "䷮"), "27": ("泽山咸", "䷞"), "28": ("泽地萃", "䷬"),
        "31": ("火天大有", "䷍"), "32": ("火泽睽", "䷥"), "33": ("离为火", "䷝"), "34": ("火雷噬嗑", "䷔"),
        "35": ("火风鼎", "䷱"), "36": ("火水未济", "䷿"), "37": ("火山旅", "䷷"), "38": ("火地晋", "䷢"),
        "41": ("雷天大壮", "䷡"), "42": ("雷泽归妹", "䷵"), "43": ("雷火丰", "䷶"), "44": ("震为雷", "䷲"),
        "45": ("雷风恒", "䷟"), "46": ("雷水解", "䷧"), "47": ("雷山小过", "䷽"), "48": ("雷地豫", "䷏"),
        "51": ("风天小畜", "䷈"), "52": ("风泽中孚", "䷿"), "53": ("风火家人", "䷤"), "54": ("风雷益", "䷩"),
        "55": ("巽为风", "䷸"), "56": ("风水涣", "䷺"), "57": ("风山渐", "䷴"), "58": ("风地观", "䷓"),
        "61": ("水天需", "䷄"), "62": ("水泽节", "䷻"), "63": ("水火既济", "䷾"), "64": ("水雷屯", "䷂"),
        "65": ("水风井", "䷯"), "66": ("坎为水", "䷜"), "67": ("水山蹇", "䷦"), "68": ("水地比", "䷇"),
        "71": ("山天大畜", "䷙"), "72": ("山泽损", "䷨"), "73": ("山火贲", "䷕"), "74": ("山雷颐", "䷚"),
        "75": ("山风蛊", "䷑"), "76": ("山水蒙", "䷃"), "77": ("艮为山", "䷳"), "78": ("山地剥", "䷖"),
        "81": ("地天泰", "䷊"), "82": ("地泽临", "䷒"), "83": ("地火明夷", "䷣"), "84": ("地雷复", "䷗"),
        "85": ("地风升", "䷭"), "86": ("地水师", "䷆"), "87": ("地山谦", "䷎"), "88": ("坤为地", "䷁")
    ]

    func getHexagram(upper: Int, lower: Int) -> (name: String, hexagram: String)? {
        let key = "\(upper)\(lower)"
        return hexagramMapping[key]
    }

}
