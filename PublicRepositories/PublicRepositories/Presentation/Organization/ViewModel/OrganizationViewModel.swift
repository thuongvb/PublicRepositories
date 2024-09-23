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
    @Injected(\.localResourceUseCase) var localResourceUseCase

    @Published var organization: OrganizationDto?
    @Published var repositories: [RepositoryDto] = []
    @Published var langColors: [String: Any] = [:]
    @Published private(set) var page: Int = 0
    @Published private(set) var loadMorable: LoadMorableType = .loaded
    @Published private(set) var errors: [NSError] = []
    private let perPage: Int = 20
    
    func fetchOrganization(with name: String) async {
        do {
            let org = try await orgUseCase.fetchOrganization(name: name)
            await MainActor.run {
                self.organization = org
            }
        } catch {
            Logging.error(error)
            await MainActor.run {
                self.errors.append(error as NSError)
            }
        }
    }
    
    func fetchOrganizationRepos(with name: String) async {
        do {
            let repos = try await orgUseCase.fetchOrganizationRepos(name: name, page: self.page, perPage: self.perPage)
            await MainActor.run {
                let oldRepos = self.repositories
                self.repositories = self.page == 0 ? repos : (repos != oldRepos ? oldRepos + repos : oldRepos)
                self.loadMorable = (self.page != 0 && (repos.isEmpty || repos == oldRepos)) ? .noMoreData : .loaded
            }
        } catch {
            Logging.error(error)
            await MainActor.run {
                self.errors.append(error as NSError)
            }
        }
    }
    
    func fetcJSONFile() async {
        do {
            let langColors = try await localResourceUseCase.fetcJSONFile(name: "github-lang-colors")
            await MainActor.run {
                self.langColors = langColors
            }
        } catch {
            Logging.error(error)
            await MainActor.run {
                self.errors.append(error as NSError)
            }
        }
    }

    func refreshable() {
        self.page = 0
    }

    func loadmorable(with name: String) async {
        guard loadMorable == .loaded else {
            Logging.debug("Loading more data...")
            return
        }

        await MainActor.run {
            self.loadMorable = .loading
            self.page += 1
        }

        await fetchOrganizationRepos(with: name)
    }
}
