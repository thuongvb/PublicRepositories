//
//  LocalResourceUseCase.swift
//  PublicRepositories
//
//  Created by Bui Van Thuong on 23/9/24.
//

import Foundation
import Factory

protocol LocalResourceUseCaseType {
    func fetcJSONFile(name: String) async throws -> [String: Any]
}

struct LocalResourceUseCase: LocalResourceUseCaseType {
    @Injected(\.localResourceRepository) private var localResourceRepository

    func fetcJSONFile(name: String) async throws -> [String : Any] {
        try await localResourceRepository.fetcJSONFile(name: name)
    }
}
