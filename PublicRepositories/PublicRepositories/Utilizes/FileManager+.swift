//
//  FileManager+.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/23/24.
//

import Foundation

enum FileManagerError: Error {
    case fileNotFound
    case contentIsEmpty
}

extension FileManager {
    func readFile(fileName: String, withExtension: String? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: withExtension) else {
            completion(.failure(FileManagerError.fileNotFound))
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
}
