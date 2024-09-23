//
//  OrganizationRepository.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
 
protocol OrganizationRepository {
    func fetchOrganization(name: String) async throws -> OrganizationDto?
    func fetchOrganizationRepos(name: String, page: Int, perPage: Int) async throws -> [RepositoryDto]
}
