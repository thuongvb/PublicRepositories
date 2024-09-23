//
//  Domain+Injection.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Factory

extension Container {
    var orgUseCase: Factory<OrganizationUseCaseType> {
        Factory(self) { OrganizationUseCase() }
    }

    var localResourceUseCase: Factory<LocalResourceUseCaseType> {
        Factory(self) { LocalResourceUseCase() }
    }
}
