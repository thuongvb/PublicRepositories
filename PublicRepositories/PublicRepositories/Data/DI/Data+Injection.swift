//
//  Data+Injection.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Factory

extension Container {
    var organizationRepository: Factory<OrganizationRepository> {
        Factory(self) { OrganizationRepositoryImpl() }
    }
}
