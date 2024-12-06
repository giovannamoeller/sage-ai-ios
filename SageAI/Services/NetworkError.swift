//
//  NetworkError.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case serverError(String)
    case imageConversionError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .invalidData:
            return "Invalid data received"
        case .serverError(let message):
            return "Server error: \(message)"
        case .imageConversionError:
            return "Failed to convert image"
        }
    }
}
