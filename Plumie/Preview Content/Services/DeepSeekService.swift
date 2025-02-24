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
            你是一个专业的梅花易数AI，帮助用户解读卦象，并提供有用的建议。

            **用户的问题**：
            「\(question)」

            **起卦信息**：
            - 主卦：「\(hexagram1.name)」（\(hexagram1.hexagram)）
            - 变卦：「\(hexagram2.name)」（\(hexagram2.hexagram)）

            **请结合这些信息，分析此卦，并提供具体的预测和建议**：
            1. **吉凶判断**：此卦对用户的问题是吉卦还是凶卦？
            2. **象征意义**：此卦暗示了哪些趋势、机会或风险？
            3. **具体建议**：结合易经的智慧，为用户提供实用的行动建议或心态调整方向。



            *** 请注意：***
            避免模棱两可的回答，必须给出明确的方向、建议和注意事项。
            请结合卦象所属的五行元素（如金、木、水、火、土），并依据 万物类象 提供具体参考：
            方位：东方属木，南方属火，西方属金，北方属水，中央属土。
            颜色：金（金属、白色），木（绿色、青色），水（黑色、深蓝色），火（红色、橙色），土（黄色、棕色）。
            人物：不同五行的人际关系可提供帮助（如火象适合找热情外向的人，土象适合找稳重可靠的长辈等）。
            场所：不同五行的场所对应不同的运势走向，如水象适合去河边思考，木象适合在书房制定计划等。
            具体应用：
            (1) 寻找失物

            若卦象显示方位信息，请结合 五行 确定可能的丢失位置：
            东方（木）：书架、植物旁、绿色家具附近。
            南方（火）：电器、厨房、暖气、红色物品旁。
            西方（金）：金属柜、白色家具、冰箱、工具房。
            北方（水）：鱼缸、浴室、黑色衣物旁、水池附近。
            中央（土）：地板、桌面、储藏室、黄色物品旁。
            (2) 事业/财运

            卦象显现发展机遇时，请结合 五行 给予建议：
            金（西方）：适合从事金融、管理、法律相关事务，可向经验丰富的长者请教。
            木（东方）：有利于新计划、新合作，适合拓展人脉、创新发展。
            水（北方）：适合冷静观察、学习提升，或探索海外、远方市场。
            火（南方）：勇敢行动、积极进取是关键，但需避免冲动决策。
            土（中央）：稳定为主，适合稳健投资，或向家族长辈、贵人求助。
            (3) 人际关系

            卦象涉及人际问题时，可结合 五行类象 提出适合的交往对象：
            金：可以向 有威望的长者或管理者 寻求指导，或依赖 规则和契约 维护关系。
            木：适合与 朋友、学者、导师 互动，或者通过 教育、成长性合作 增进联系。
            水：适合 多听少说，观察后行动，适合与 性格温和、善于应变的人 交往。
            火：需要 主动沟通、展示热情，适合参加 社交活动、结交外向的朋友。
            土：应 稳重、信守承诺，适合向 家庭长辈、资深人士 求助，或者依赖 信任和长期关系。
            (4) 适合行动的时间

            若卦象显示不宜行动，请说明原因，并建议 适合的时机：
            金旺时（秋季、申酉月）：适合决策、签订合同、进行收获。
            木旺时（春季、寅卯月）：适合开始新计划、学习新知识、拓展人际关系。
            水旺时（冬季、亥子月）：适合养精蓄锐、反思调整、隐忍积蓄力量。
            火旺时（夏季、巳午月）：适合竞争、演讲、展现自我，但需控制情绪避免冲突。
            土旺时（季节交替之时、辰戌丑未月）：适合整合资源、稳健推进、打好基础。
            
            
            （5）额外优化
            避免 使用 模糊 或 过度抽象 的词语，必须提供具体建议。
            用现代中文表达，避免难懂的古文或生僻术语，使用户能 轻松理解。
            控制答案字数，不超过 300 字，以确保内容清晰、直击要点。

            
            （6）请根据用户问题和卦象进行分析，并按照以下格式输出，不要使用Markdown符号,不要使用Markdown符号,不要使用Markdown符号，不要使用bullet point。只可以使用自然人类语言：
            
            此卦象意味着： 【请判断吉凶】。
            您可以： 【请提供具体建议】。
            
            （7）【非常重要】如果用户的问题不适合作为占卜问题，请直接回复 “此问题不适合使用梅花易数进行干涉，原因：” + 具体原因，不做无意义解读。
                    占卜适用的问题：
                        未来发展（如“我近期的事业运如何？”）
                        决策选择（如“我应该换工作吗？”）
                        人际关系（如“我该如何与某人相处？”）
                        寻找事物（如“我的钥匙可能在哪里？”）
                    不适合占卜的问题：
                        涉及医疗、法律、科学计算等客观事实（如“感冒了怎么办？”、“地球是圆的吗？”）
                        没有明确指向的开放性问题（如“讲个笑话”）
                        不含实际需求的无意义问题（如“你是谁？”、“12345”）
            
            
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
