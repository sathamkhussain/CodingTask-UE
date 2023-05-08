//
//  APIService.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import Foundation
class APIService: NSObject {

    
    static let nyTimesURL =  URL(string:getURL() )
    
    static func fetchMostViewedNews() async throws -> NYTimesData? {
        guard let url = nyTimesURL else{
            throw APIError.invalidURL
        }
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                throw APIError.invalidResponseStatus
            }
            do {
                let locations = try JSONDecoder().decode(NYTimesData.self, from: data)
                return locations
            } catch {
                throw APIError.decodingError(error.localizedDescription)
            }

        }catch{
            throw APIError.dataTaskError(error.localizedDescription)
        }
    }
    
    static func getURL() -> String {
        return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=\(APIKeys.newyorkTimes.value)"
    }
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)

    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return NSLocalizedString("The endpoint URL is invalid", comment: "")
            case .invalidResponseStatus:
                return NSLocalizedString("The API failed to issue a valid response.", comment: "")
            case .dataTaskError(let string):
                return string
            case .corruptData:
                return NSLocalizedString("The data provided appears to be corrupt", comment: "")
            case .decodingError(let string):
                return string
        }
    }
}
