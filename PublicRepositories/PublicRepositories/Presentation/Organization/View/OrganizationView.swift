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
                orgPopularReposView()
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
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func repoInfoCardView(for repo: RepositoryDto) -> some View {
        VStack {
            HStack {
                Text(repo.name)
                
                Text(repo.visibility.rawValue.capitalized)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .overlay(
                        Capsule()
                            .fill(Color.clear)
                            .stroke(.gray.opacity(0.4))
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
