import Foundation

class NetworkService {
    
    let appID = "02a082f1be3fb9bbf041f849ca8ad290"
    
    func getWeather(for city: String, completion: @escaping (Result<[Weather]?,Error>)->Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appID)"
        guard  let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
               
            }
            guard let data = data  else {return}
            
            let decodedData = try? JSONDecoder().decode(Weather.self, from: data)
            
            if let data = decodedData {
                DispatchQueue.main.async {
                    completion(.success([data.self]))
                 
                    
                }
            }
        }.resume()
    }
           
}

