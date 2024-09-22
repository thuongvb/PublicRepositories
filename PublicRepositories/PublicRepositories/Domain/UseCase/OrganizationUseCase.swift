//
//  OrganizationUseCase.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Factory

protocol OrganizationUseCaseType {
    func fetchOrganization(name: String) async -> OrganizationDto?
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async -> [RepositoryDto]
}

struct OrganizationUseCase: OrganizationUseCaseType {
    @Injected(\.organizationRepository) private var organizationRepository

    func fetchOrganization(name: String) async -> OrganizationDto? {
        await organizationRepository.fetchOrganization(name: name)
    }
    
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async -> [RepositoryDto] {
        await organizationRepository.fetchOrganizationRepos(name: name, page: page, perPage: perPage)
    }
    
}
