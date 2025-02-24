import Foundation
import LunarSwift

class HexagramViewModel: ObservableObject {
    @Published var selectedHexagram: Hexagram?
    @Published var transformedHexagram: Hexagram?
    @Published var interpretation: String = ""
    @Published var isLoading: Bool = false
    
    private func applyChangingLine(key: String, changingLine: Int) -> String {
        let hexagramData = HexagramData()
        // get hexagram binary
        guard let firstBinary = hexagramData.hexagramBinaryMapping[String(key.prefix(1))],
              let secondBinary = hexagramData.hexagramBinaryMapping[String(key.dropFirst().prefix(1))]
        else {
            return key
        }

        let hexagramBinary = firstBinary + secondBinary
        
        print("Hexagram Binary: \(hexagramBinary)")

        
        // turn into array
        var lines = Array(hexagramBinary)
        var index = 0
        // reverse Yin/Yang
        if changingLine == 0 {
            index = 0
        }
        else {
            index = 5 - changingLine 
        }
        
        if index >= 0 && index < 6 {
            lines[index] = (lines[index] == "1") ? "0" : "1"
        }
        
        //generate new key
        let newHexagramBinary = String(lines)
        let firstThree = String(newHexagramBinary.prefix(3))  // Get first character as String
        let secondThree = String(newHexagramBinary.dropFirst(3).prefix(3))  // Get second character

        if let firstMapped = hexagramData.reverseHexagramMapping[firstThree],
           let secondMapped = hexagramData.reverseHexagramMapping[secondThree] {
            print("New Hexagram Binary: \(newHexagramBinary)")
            return firstMapped + secondMapped
        }
        
        print("Invalid Hexagram Binary: \(newHexagramBinary)")

        // If invalid, return original key
        return newHexagramBinary

    }

    func generateHexagramFromLunarDate(question: String) {
        //Get current local time

        let solar = Solar.fromDate(date: Date())
        let lunar = solar.lunar

        let lunarYear = lunar.year
        let lunarMonth = lunar.month
        let lunarDay = lunar.day
        var lunarHour = lunar.hour
        lunarHour = Int(((lunarHour + 1) % 24) / 2) + 1

        print("Lunar Date: \(lunarYear)年 \(lunarMonth)月 \(lunarDay)日 时:\(lunar.hour) 时辰: \(lunarHour)")

        // Compute hexagram using Lunar Date
        let upper = (lunarYear + lunarMonth + lunarDay) % 8
        let lower = (lunarHour) % 8
        let changingLine = (lunarYear + lunarMonth + lunarDay + lunarHour) % 6
        print("Upper: \(upper) Lower: \(lower) Changing Line: \(changingLine)")

        

        let key = "\(upper == 0 ? 8 : upper)\(lower == 0 ? 8 : lower)"
        selectedHexagram = HexagramData().hexagrams[key]
        
        // Apply changing line
        transformedHexagram = nil
                var transformedKey = key
                if changingLine >= 0 {
                    transformedKey = applyChangingLine(key: key, changingLine: changingLine)
                    print(transformedKey)
                    transformedHexagram = HexagramData().hexagrams[transformedKey]
                }
        
        print("Transformed Hexagram: \(transformedHexagram?.name ?? "Unknown")")

        print("Generated Hexagram: \(selectedHexagram?.name ?? "Unknown")")
        
        guard let hexagram1 = selectedHexagram, let hexagram2 = transformedHexagram else {
            print("Missing hexagrams, cannot fetch interpretation.")
            return
        }
        
        isLoading = true

        let deepSeekService = DeepSeekService()
        deepSeekService.fetchInterpretation(
            question: question,
            hexagram1: hexagram1,
            hexagram2: hexagram2
        ) { [weak self] interpretationText in
            DispatchQueue.main.async {
                self?.interpretation = interpretationText ?? "AI 神棍没有给出解读 🧐"
                self?.isLoading = false
            }
        }


    }
    

}


