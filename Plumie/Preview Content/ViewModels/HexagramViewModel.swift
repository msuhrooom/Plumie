import Foundation
import LunarSwift

class HexagramViewModel: ObservableObject {
    @Published var selectedHexagram: Hexagram?

    func generateHexagramFromLunarDate() {
        //Get current local time

        let solar = Solar.fromDate(date: Date())
        let lunar = solar.lunar

        let lunarYear = lunar.year
        let lunarMonth = lunar.month
        let lunarDay = lunar.day
        let lunarHour = lunar.hour

        print("Lunar Date: \(lunarYear)年 \(lunarMonth)月 \(lunarDay)日 时辰: \(lunarHour)")

        // Compute hexagram using Lunar Date
        let upper = (lunarYear + lunarMonth + lunarDay) % 8
        let lower = (lunarHour) % 8
        _ = (lunarYear + lunarMonth + lunarDay + lunarHour) % 6

        let key = "\(upper == 0 ? 8 : upper)\(lower == 0 ? 8 : lower)"
        selectedHexagram = HexagramData().hexagrams[key]

        print("Generated Hexagram: \(selectedHexagram?.name ?? "Unknown")")
    }
}


