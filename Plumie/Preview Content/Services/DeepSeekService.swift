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

            **请注意**：
            
            1. **避免模棱两可**：回答需给出具体方向、建议、注意事项。

            2. **五行&方位**：根据卦象所属的五行元素（如金、木、水、火、土），并结合传统“万物类象”中的方位、颜色、人物关系等，给出更深入的参考：
               - **金**：多与白色、金属、收敛之气相关；方位多在西方。  
                 - **人际**：可寻求个性坚毅或能干练断者（或属金之人）帮助。  
                 - **地点**：金属器具旁、冰箱、金属柜、白色建筑/物品附近。
               - **木**：多与绿色、生发、成长相关；方位多在东方。  
                 - **人际**：可请教有创造力、木气旺或善于规划的朋友；女性长辈/闺蜜若与木相关也可。  
                 - **地点**：书柜、花草、青色或绿色物品旁、东方房间等。
               - **水**：多与黑色、流动之意相关；方位多在北方。  
                 - **人际**：遇到瓶颈或需转变时，适合与温和包容、具流动思维者交流；或请求性格柔和的女性朋友帮忙。  
                 - **地点**：江边、湖旁、水池、鱼缸、黑色物品或北方区域。
               - **火**：多与红色、热量、激烈之势相关；方位多在南方。  
                 - **人际**：适合寻求外向热情、资源丰富或社会关系广者帮忙；或主动参加社交活动。  
                 - **地点**：热源、电器附近、红色装饰物、厨房、南向房间等。
               - **土**：多与黄色、稳重、中宫相关；方位多在中央或居中位置。  
                 - **人际**：可找性格务实、敦厚之人；家庭长辈、领导也可能起关键作用。  
                 - **地点**：居家中心、黄色物品旁、储物间、地面等。

            3. **若为寻物问题**：请结合上方五行与方位提示更具体位置。  
               - 举例：如果卦象属“水”，可往北方、水源附近或黑色物件处寻找。  
               - 若卦象为“金”，可往西边或金属家具旁等处查找。

            4. **若卦象显示不宜行动**：说明原因，并给出替代方案或更合适的时机。  
               - 可以提示“暂缓”、“宜静不宜动”、“先整合资源后再出发”等具体方案。

            5. **扩展到人际关系、运势**：除了寻物，也给出**事业、财运、健康、情感**等层面的简要指引：  
               - 举例：若为“火”之卦，可暗示社交活跃期，建议多结交新朋友；若为“水”之卦，则多提醒谨慎，保留弹性空间。

            6. **语言要求**：  
               - 用现代中文，简洁易懂；避免繁琐古文或生僻术语。  
               - 总字数不超过 400 字。

            7. **实用性**：  
               - 给出可执行的操作、建议或心态调整方式，帮助用户做出更好的决策。

            请根据用户问题和卦象进行分析，并按照以下格式输出，不要使用Markdown符号：
            主卦为 \(hexagram1.name)，变卦 \(hexagram2.name)。
            这意味着 【请判断吉凶】。
            你可以 【请提供具体建议】。
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
