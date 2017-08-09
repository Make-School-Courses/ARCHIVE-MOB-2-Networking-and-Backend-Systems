//: [Previous](@previous)

import Foundation
import PlaygroundSupport

struct Anime {
    let title: String
    let thumbnail: URL
    
    init(title: String, thumbnail: URL) {
        self.title = title
        self.thumbnail = thumbnail
    }
}

extension Anime: Decodable {
    
    // Declaring our keys
    enum Keys: String, CodingKey {
        case title
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self) // defining our (keyed) container
        let title: String = try container.decode(String.self, forKey: .title) // extracting the data
        let thumbnail: URL = try container.decode(URL.self, forKey: .thumbnail)
        
        self.init(title: title, thumbnail: thumbnail)
    }
}

//: Defining the types of errors our application can have
enum NetworkError: Error {
    case unknown
    case couldNotParseJSON
}

enum Result<T> {
    case success(T)
    case failure(NetworkError)
}

class Networking {
    let session = URLSession.shared
    let baseURL = URL(string: "https://kitsu.io/api/edge/anime")!
    
    func getAnime(id: String, completion: @escaping (Result<[Anime]>) -> Void) {
        
        var request = URLRequest(url: baseURL)
        
        session.dataTask(with: baseURL) { (data, resp, err) in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Data
                
                guard let anime = try? JSONDecoder().decode([Anime].self, from: json) else {return completion(Result.failure(NetworkError.couldNotParseJSON)) }
                
                completion(Result.success(anime))
            }
            }.resume()
    }
}

let result = Networking()
result.getAnime(id: "1") { (res) in
    print(res)
}

PlaygroundPage.current.needsIndefiniteExecution = true


//: [Next](@next)
