import Foundation

func fetchNews() {
    // URL მისამართი top headlines-ის API-სთვის
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us")!
    
    // API key
    let apiKey = "2e41c513815843378fa95bace03e6dff"
    
    // URL მოთხოვნის შექმნა
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
    
    // URLSession - მოთხოვნის შესრულება
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("მოხდა შეცდომა: \(error)")
            return
        }
        
        guard let data = data else {
            print("პასუხი ცარიელია.")
            return
        }

        // JSON ფორმატში მონაცემების დეკოდირება
        do {
            if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let articles = jsonResponse["articles"] as? [[String: Any]] {
                
                for article in articles {
                    let title = article["title"] as? String ?? "სათაური არ არის"
                    let author = article["author"] as? String ?? "ავტორი არ არის მითითებული"
                    let publishedAt = article["publishedAt"] as? String ?? "თარიღი არ არის"
                    let imageUrl = article["urlToImage"] as? String ?? "ფოტო არ არის"

                    print("სათაური: \(title)")
                    print("ავტორი: \(author)")
                    print("გამოქვეყნების თარიღი: \(publishedAt)")
                    print("ფოტო URL: \(imageUrl)\n")
                }
            }
        } catch {
            print("JSON დეკოდირების შეცდომა: \(error)")
        }
    }
    
    // დავალების დაწყება
    task.resume()
}

// ფუნქციის გამოძახება

