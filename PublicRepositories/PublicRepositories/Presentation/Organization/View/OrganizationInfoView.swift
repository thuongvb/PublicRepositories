//
//  OrganizationInfoView.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import SwiftUI

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
        //
        let followers = viewModel.organization?.followers ?? 0
        let followersText = followers == 1 ? "follower" : "followers"
        
        //
        let location = viewModel.organization?.location ?? "N/A"
        
        //
        let ref = viewModel.organization?.blog ?? "N/A"
        
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.organization?.name ?? "")
                .font(.headline)

            Text(viewModel.organization?.description ?? "")
                .font(.caption)
                .foregroundStyle(Color.gray)

            HStack {
                Image(systemName: "person.2")
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .scaleEffect(x: -1, y: 1)
                
                Text("\(followers.shorted()) \(followersText)")
                    .font(.caption2)
            }
            
            HStack {
                Image(.locationMarkIcon)
                    .font(.caption2)
                    .fontWeight(.semibold)
                
                Text(location)
                    .font(.caption2)
            }
            
            HStack {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 16, height: 16)
                
                Text("[\(ref)](\(ref))")
                    .font(.caption2)
            }
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
    }

}
