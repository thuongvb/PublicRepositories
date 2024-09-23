//
//  LocalResourceRepository.swift
//  PublicRepositories
//
//  Created by Bui Van Thuong on 23/9/24.
//

import Foundation

protocol LocalResourceRepository {
    func fetcJSONFile(name: String) async throws -> [String: Any]
}
