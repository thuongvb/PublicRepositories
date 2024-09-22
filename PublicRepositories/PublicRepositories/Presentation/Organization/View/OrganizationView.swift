//
//  OrganizationView.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import SwiftUI

struct OrganizationView: View {
    @StateObject var viewModel: OrganizationViewModel = .init()
    
    let name: String
    
    var body: some View {
        ZStack {
            ScrollView {
                orgBannerView()
            }
        }
        .task {
            await viewModel.fetchOrganization(with: name)
            await viewModel.fetchOrganizationRepos(with: name)
        }
    }
    
    @ViewBuilder
    func orgPopularReposView() -> some View {
        LazyVStack {
            ForEach(viewModel.repositories, id: \.id) { repo in
                repoInfoCardView(for: repo)
            }
            
        }
    }
    
    @ViewBuilder
    func repoInfoCardView(for repo: RepositoryDto) -> some View {
        VStack {
            HStack {
                Text(repo.name)
            }
        }
    }
}

#Preview {
    ContentView()
}
