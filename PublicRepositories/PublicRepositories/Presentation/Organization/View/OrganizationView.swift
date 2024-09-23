//
//  OrganizationView.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import SwiftUI

struct OrganizationView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: OrganizationViewModel = .init()
    
    @State private var lastItemAppeared: Int? = nil
    var isLoading: Binding<Bool> {
        Binding(
            get: { viewModel.repositories.isEmpty },
            set: { _ in }
        )
    }
    
    let name: String
    
    var body: some View {
        ZStack {
            ScrollView {
                orgBannerView()
                orgPopularReposView()
            }
            .refreshable {
                return await Task {
                    await MainActor.run {
                        viewModel.refreshable()
                    }
                    await viewModel.fetchOrganization(with: name)
                    await viewModel.fetchOrganizationRepos(with: name)
                }.value
            }
        }
        .task {
            await viewModel.fetcJSONFile()
        }
        .task {
            await viewModel.fetchOrganization(with: name)
            await viewModel.fetchOrganizationRepos(with: name)
        }
        .task(id: lastItemAppeared) {
            guard lastItemAppeared != nil && viewModel.loadMorable == .loaded else {
                return
            }
            await viewModel.loadmorable(with: name)
        }
    }
}

// MARK: - Organization Infomation View -
extension OrganizationView {
    @ViewBuilder
    func orgBannerView() -> some View {
        HStack(alignment: .top) {
            orgAvatarView()
            infoView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .padding()
    }
    

    @ViewBuilder
    func infoView() -> some View {
        // - followers
        let followers = viewModel.organization?.followers ?? 0
        let followersText = followers == 1 ? "follower" : "followers"
        
        // - location
        let location = viewModel.organization?.location ?? "N/A"
        
        // - blog
        let blog = viewModel.organization?.blog ?? "N/A"
        
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.organization?.name ?? "")
                .font(.headline)
                .shimmering(active: isLoading)

            Text(viewModel.organization?.description ?? "")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .shimmering(active: isLoading)

            HStack {
                Image(systemName: "person.2")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .scaleEffect(x: -1, y: 1)
                
                Text("\(followers.shorted()) \(followersText)")
                    .font(.caption2)
            }
            .shimmering(active: isLoading)

            HStack {
                Image(.locationMarkIcon)
                    .renderingMode(.template)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)

                Text(location)
                    .font(.caption2)
            }
            .shimmering(active: isLoading)

            HStack {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("[\(blog)](\(blog))")
                    .font(.caption2)
            }
            .shimmering(active: isLoading)
        }
    }
    
    @ViewBuilder
    func orgAvatarView() -> some View {
        let url = URL(string: viewModel.organization?.avatarURL ?? "")
        AsyncImage(url: url) { image in
            image
                .resizable()
        } placeholder: {
            ZStack {
                Image(systemName: "photo.fill")
                    .font(.title)
                    .opacity(0.4)
                ProgressView()
                    .tint(.black)
            }
        }
        .frame(width: 80.0, height: 80.0)
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.clear)
                .stroke(.gray.opacity(0.2))
        )
        .shimmering(active: isLoading)
    }
}

// MARK: - Organization's Popular Repositories View -
extension OrganizationView {
    @ViewBuilder
    func orgPopularReposView() -> some View {
        LazyVStack {
            Group {
                Text("POPULAR_REPOS".localized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if viewModel.repositories.isEmpty {
                    emptyCardView()
                } else {
                    ForEach(viewModel.repositories, id: \.id) { repo in
                        Button {
                            // Handle somethings
                        } label: {
                            repoInfoCardView(for: repo)
                        }
                        .buttonStyle(.zoomable)
                        .onAppear {
                            repoCardOnAppearHandler(repo: repo)
                        }
                    }
                }

                bottomListView()
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
    
    @ViewBuilder
    func repoInfoCardView(for repo: RepositoryDto) -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text(repo.name)
                    .lineLimit(1)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.blue)

                Spacer(minLength: 8)

                Text(repo.visibility.capitalized)
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

            if let description = repo.description {
                Text(description)
                    .font(.caption)
                    .foregroundStyle(Color.gray)
            }

            HStack {
                if let language = repo.language {
                    languageView(language: language)
                }

                stargazersView(stargazersCount: repo.stargazersCount)

                forksView(forksCount: repo.forksCount)
            }
            .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .clipShape(.rect(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.clear)
                .stroke(.gray.opacity(0.2))
        )
    }
    
    @ViewBuilder
    func emptyCardView() -> some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Repository title")
                    .lineLimit(1)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.blue)
                    .shimmering()

                Spacer(minLength: 8)

                Text("Public")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .overlay(
                        Capsule()
                            .fill(Color.clear)
                            .stroke(.gray.opacity(0.4))
                    )
                    .shimmering()
            }

            Text("Repository description")
                .font(.caption)
                .foregroundStyle(Color.gray)
                .shimmering()

            HStack {
                Text("Repository more infomation.")
            }
            .font(.caption)
            .shimmering()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .clipShape(.rect(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.clear)
                .stroke(.gray.opacity(0.2))
        )
    }


    @ViewBuilder
    func languageView(language: String) -> some View {
        HStack {
            if let colorHex = self.viewModel.langColors[language] as? String {
                Color(hex: colorHex)
                    .frame(width: 12, height: 12)
                    .clipShape(.circle)
            }

            Text(language)
        }
    }

    @ViewBuilder
    func stargazersView(stargazersCount: Int) -> some View {
        HStack {
            Image(systemName: "star")
                .resizable()
                .frame(width: 12, height: 12)
                .font(.caption2)
                .fontWeight(.bold)

            Text(stargazersCount.shorted())
        }
    }

    @ViewBuilder
    func forksView(forksCount: Int) -> some View {
        HStack {
            Image(.currentBranchIcon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 16, height: 16)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)

            Text(forksCount.shorted())
        }
    }

    @ViewBuilder
    func bottomListView() -> some View {
        switch viewModel.loadMorable {
        case .loading:
            emptyCardView()
        case .noMoreData:
            Text("NO_MORE_DATA".localized)
                .font(.callout)
                .padding()
        case .loaded:
            EmptyView()
        }
    }

    func repoCardOnAppearHandler(repo: RepositoryDto) {
        let isLast = repo.id == viewModel.repositories.last?.id
        lastItemAppeared = isLast ? repo.id : nil
    }
}


#Preview {
    ContentView()
}
