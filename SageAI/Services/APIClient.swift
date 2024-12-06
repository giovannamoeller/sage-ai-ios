//
//  APIClient.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

class APIClient {
    static let shared = APIClient()
    
    private let baseURL = "http://localhost:8000"
    private let session: URLSession
    private let jsonDecoder: JSONDecoder
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 300
        
        self.session = URLSession(configuration: configuration)
        self.jsonDecoder = JSONDecoder()
    }
    
    // MARK: - Food Analysis
    func analyzeFoodImage(_ image: UIImage) async throws -> FoodAnalysisResponse {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw NetworkError.imageConversionError
        }
        
        let url = URL(string: "\(baseURL)/analyze_food")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"food.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Status code: \(httpResponse.statusCode)")
        }
        
        return try jsonDecoder.decode(FoodAnalysisResponse.self, from: data)
    }
    
    // MARK: - Restaurant Suggestions
    func getRestaurantSuggestions(latitude: Double, longitude: Double) async throws -> RestaurantResponse {
        let locationRequest = LocationRequest(latitude: latitude, longitude: longitude)
        
        guard let url = URL(string: "\(baseURL)/restaurant_suggestions") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(locationRequest)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Status code: \(httpResponse.statusCode)")
        }
        
        return try jsonDecoder.decode(RestaurantResponse.self, from: data)
    }
    
    // MARK: - Daily Routine
    func generateDailyRoutine(schedule: [String: Any]) async throws -> RoutineResponse {
        guard let url = URL(string: "\(baseURL)/generate_routine") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: schedule)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError("Status code: \(httpResponse.statusCode)")
        }
        
        return try jsonDecoder.decode(RoutineResponse.self, from: data)
    }
}
