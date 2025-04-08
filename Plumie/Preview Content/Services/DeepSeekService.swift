import Foundation

class DeepSeekService {
    // Replace this placeholder with your actual DeepSeek endpoint
    private let baseUrl = URL(string: "https://api.deepseek.com/beta/chat/completions")!

    // Provide your API key or authentication token as needed
    private let apiKey = Secrets.deepSeekAPIKey
    
    

    func fetchInterpretation(question: String,
                                 hexagram1: Hexagram,
                                 hexagram2: Hexagram,
                                 completion: @escaping (String?) -> Void) {
            
            // Construct the AI prompt
            let prompt = """
            你是一位精通梅花易数的易学大师，我将给你一个主卦、变卦、动爻、起卦时间和起卦问题，请你根据六亲、生克关系、世应、动爻变化、万物类象，进行详细分析并判断吉凶。

                        **用户的问题**：
                        「\(question)」

                        **起卦信息**：
                        - 主卦：「\(hexagram1.name)」（\(hexagram1.hexagram)）
                        - 变卦：「\(hexagram2.name)」（\(hexagram2.hexagram)）


            请从以下方面依次展开分析：

            1. 六亲配置：标注六爻中各爻的六亲关系，并指出哪个爻代表核心事物（比如财爻、官鬼爻等）。
            2. 世应关系：指出世爻、应爻的位置与象征意义（谁是我，谁是对方）。
            3. 动爻变化：哪个爻动？动后变成什么？是否生我、克我？
            4. 五行生克：分析主要爻之间的五行关系，谁生谁、谁克谁。
            5. 类象分析：结合卦象（如乾为天、坤为地等）与六亲类象，分析现实中的可能含义。
            6. 吉凶判断：总体推测事情是否有利、结果如何。

            请按照六个分析步骤详细给出一个易于普通用户理解的综合解释。控制答案字数，不超过 450 字，用自然文字回答（不要使用markdown或者bullet point, 或者1，2，3，4）避免模棱两可的回答，必须给出明确的方向、建议和注意事项。

            如果用户的问题不适合作为占卜问题（根据以下定义），请直接回复 “此问题不适合使用梅花易数进行干涉，原因：” + 具体原因，不做无意义解读。
                                以下是所有不适合占卜的问题：
                                    没有明确指向的开放性问题（如“讲个笑话”）
                                    不含实际需求的无意义问题（如“你是谁？”、“12345”）
            
            对于一些具有娱乐性或幽默感的问题（如“我现在应该玩守望先锋吗？”、“地球是圆的吗？”这类），可以适当加入轻松幽默的表达方式，让回应更具亲和力，但仍需保持解卦逻辑的严谨性与专业性。
            解卦内容应依然按照六亲、世应、动爻、类象、生克等原理展开，在结尾处可以加入一句风格温和的幽默回应作为点缀，例如：“所以，是时候一边打守望先锋一边思考人生了。”或“虽然地球是否是圆的我们不占，但你今天的心情很可能是圆的～”
            这样既保证内容的价值，又增加趣味性和用户粘性。

            **回答案例**

            用户的问题：
            「我丢失的钱包能找回来吗？」

            起卦信息：
            - 主卦：「山雷颐」（☶☳）
            - 变卦：「山风蛊」（☶☴）
            - 动爻：六五动（阴爻变阳爻）

            Sample Response：
            你问的是“钱包丢了还能找回来吗？”，我们一起来看看这卦的意思。
            这次起的是「山雷颐」变为「山风蛊」，动的是第五爻，对应的是“父母爻”。在梅花易数里，父母爻通常代表信息、线索、提示之类的东西，所以你现在很可能会接收到一些有关钱包的消息，比如别人捡到了、或者你突然想起可能落在哪。
            钱包本身在卦中由“妻财爻”代表，它在初爻位置，虽然没有动、也没有被冲克，说明钱包目前可能还安稳存在于某个地方，还没被破坏或者丢得太远。
            你代表的“世爻”在第三爻，显示你目前还处于比较被动的状态，可能还没开始积极寻找。而对方或者外部环境，是应爻，在最上面一爻，没动，说明捡到的人暂时也没有主动联系你。
            不过，这个动爻是“父母爻动变为金爻”，象征“线索浮现”，也就是说，只要你开始查找，比如回想路线、查看监控、联系可能途经的地方，是有机会找到钱包的。
            总体来看：钱包现在还存在，丢失的严重性不高，有望找回，但你必须主动出击，不能等别人送上门。
            建议： 赶快回忆路线，打电话问问有没有人捡到，或者看看定位记录，说不定真的能找回来！

            
            """

            // Prepare request body
            let requestBody: [String: Any] = [
                "model": "deepseek-chat",
                "messages": [
                    ["role": "system", "content": "你是一个专业的梅花易数AI，帮助用户解读卦象。"],
                    ["role": "user", "content": prompt]
                ],
                "stream": false
            ]

            // Create request
            var request = URLRequest(url: baseUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

            // Encode request body
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            } catch {
                print("Error encoding request: \(error.localizedDescription)")
                completion(nil)
                return
            }

            // Perform request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }

                // DEBUG: Print raw response data
                if let rawString = String(data: data, encoding: .utf8) {
                    print("🔹 DeepSeek Raw Response: \(rawString)")
                } else {
                    print("🔸 Response could not be decoded as UTF-8 string.")
                }

                // Parse response
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    print("✅ Parsed JSON: \(jsonObject)")

                    if let json = jsonObject as? [String: Any],
                       let choices = json["choices"] as? [[String: Any]],
                       let firstChoice = choices.first,
                       let message = firstChoice["message"] as? [String: Any],
                       let content = message["content"] as? String {
                        completion(content)
                    } else {
                        print("🚨 DeepSeek response missing expected keys.")
                        completion(nil)
                    }
                } catch {
                    print("❌ JSON Parsing Error: \(error.localizedDescription)")
                    completion(nil)
                }
            }
            task.resume()
        }
}
