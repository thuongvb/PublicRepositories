//
//  OrganizationRepositoryImpl.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Factory
import Foundation

struct OrganizationRepositoryImpl: OrganizationRepository {
    func fetchOrganization(name: String) async throws -> OrganizationDto? {
        try await APIService.shared.request(.organizationInfo(name))
    }
    
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async throws -> [RepositoryDto] {
        try await APIService.shared.request(.organizationRepos(name, page, perPage))
    }
}
