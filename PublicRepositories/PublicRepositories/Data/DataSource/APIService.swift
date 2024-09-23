//
//  APIService.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    func request<T: Codable>(_ url: APIService.Urls) async throws -> T? {
        do {
            let request = AF.request(
                url.urlString,
                method: url.method,
                parameters: url.parameters,
                encoding: url.parametersEncoding,
                headers: url.headers
            )
            
            loggingRequest(url)
            return try await request
                .validate()
                .response(completionHandler: loggingResponse)
                .serializingDecodable(T.self)
                .value
            
        } catch {
            handleResponseError(error)
            throw error
        }
    }
    
    func request<T: Codable>(_ url: APIService.Urls) async throws -> [T] {
        do {
            let request = AF.request(
                url.urlString,
                method: url.method,
                parameters: url.parameters,
                encoding: url.parametersEncoding,
                headers: url.headers
            )
            
            loggingRequest(url)
            return try await request
                .validate()
                .response(completionHandler: loggingResponse)
                .serializingDecodable([T].self)
                .value
            
        } catch {
            handleResponseError(error)
            throw error
        }
    }
    
    func handleResponseError(_ error: Error) {
        Logging.error(error)
        if let afError = error.asAFError {
            switch afError.responseCode {
            case 401, 403:
                // 401: Expired token, 403: Forbidden access.
                // Logout function.
                break
            default:
                // Error handling if needed.
                break
            }
        }
    }
    
    func loggingRequest(_ request: APIService.Urls) {
        Logging.debug(
            """
            [API REQUEST]
            - url: \(String(describing: request.urlString))
            - method: \(String(describing: request.method.rawValue))
            - params: \(String(describing: request.parameters))
            """
        )
    }
    
    func loggingResponse(_ response: AFDataResponse<Data?>) {
        let responseString: String
        if let error = response.error {
            responseString = "- error: \(String(describing: error))"
        } else {
            responseString = "- data: \(String(describing: String(data: response.data ?? Data(), encoding: .utf8)))"
        }
        
        Logging.debug(
            """
            [API RESPONSE]
            - url: \(String(describing: response.request?.url?.absoluteString))
            - method: \(String(describing: response.request?.method))
            \(responseString)
            """
        )
    }
    
}
