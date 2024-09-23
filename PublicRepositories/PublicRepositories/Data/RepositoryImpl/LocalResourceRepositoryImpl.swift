//
//  LocalResourceRepositoryImpl.swift
//  PublicRepositories
//
//  Created by Bui Van Thuong on 23/9/24.
//

import Foundation

struct LocalResourceRepositoryImpl: LocalResourceRepository {
    func fetcJSONFile(name: String) async throws -> [String : Any] {
        return try await withCheckedThrowingContinuation { continuation in
            FileManager.default.readFile(fileName: name, withExtension: "json") { result in
                switch result {
                case .success(let data):
                    do {
                        let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                        continuation.resume(returning: dict ?? [:])
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
