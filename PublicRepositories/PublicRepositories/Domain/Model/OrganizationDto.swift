//
//  OrganizationDto.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation

struct OrganizationDto: Codable, Hashable, Sendable {
    let login: String
    let id: Int
    let nodeID: String
    let url: String
    let reposURL: String
    let eventsURL: String
    let hooksURL: String
    let issuesURL: String
    let membersURL: String
    let publicMembersURL: String
    let avatarURL: String
    let description: String
    let name: String
    let company: String?
    let blog: String
    let location: String
    let email: String
    let twitterUsername: String
    let isVerified: Bool
    let hasOrganizationProjects: Bool
    let hasRepositoryProjects: Bool
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let htmlURL: String
    let createdAt: String
    let updatedAt: String
    let archivedAt: String?
    let type: String

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case url = "url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case hooksURL = "hooks_url"
        case issuesURL = "issues_url"
        case membersURL = "members_url"
        case publicMembersURL = "public_members_url"
        case avatarURL = "avatar_url"
        case description = "description"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case twitterUsername = "twitter_username"
        case isVerified = "is_verified"
        case hasOrganizationProjects = "has_organization_projects"
        case hasRepositoryProjects = "has_repository_projects"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers = "followers"
        case following = "following"
        case htmlURL = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case archivedAt = "archived_at"
        case type = "type"
    }
}
