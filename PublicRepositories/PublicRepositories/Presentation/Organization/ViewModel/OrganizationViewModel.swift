//
//  OrganizationViewModel.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Factory

class OrganizationViewModel: ObservableObject {
    @Injected(\.orgUseCase) var orgUseCase

    @Published var organization: OrganizationDto?
    @Published var repositories: [RepositoryDto] = []
    @Published private(set) var page: Int = 0
    private let perPage: Int = 20
    
    func fetchOrganization(with name: String) async {
        let org = await orgUseCase.fetchOrganization(name: name)
        await MainActor.run {
            self.organization = org
        }
    }
    
    func fetchOrganizationRepos(with name: String) async {
        let repos = await orgUseCase.fetchOrganizationRepos(name: name, page: self.page, perPage: self.perPage)
        await MainActor.run {
            self.repositories = repos
        }
    }
}
