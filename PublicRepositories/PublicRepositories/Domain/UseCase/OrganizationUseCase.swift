//
//  OrganizationUseCase.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Factory

protocol OrganizationUseCaseType {
    func fetchOrganization(name: String) async throws -> OrganizationDto?
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async throws -> [RepositoryDto]
}

struct OrganizationUseCase: OrganizationUseCaseType {
    @Injected(\.organizationRepository) private var organizationRepository
    
    func fetchOrganization(name: String) async throws -> OrganizationDto? {
        try await organizationRepository.fetchOrganization(name: name)
    }
    
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async throws -> [RepositoryDto] {
        try await organizationRepository.fetchOrganizationRepos(name: name, page: page, perPage: perPage)
    }
    
}
