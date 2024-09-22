//
//  RepositoryDto.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation

struct RepositoryDto: Codable, Hashable, Sendable {
    let id: Int
    let nodeID: String
    let name: String
    let fullName: String
    let repositoryDtoPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let description: String?
    let fork: Bool
    let url: String
    let forksURL: String
    let keysURL: String
    let collaboratorsURL: String
    let teamsURL: String
    let hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL: String
    let branchesURL: String
    let tagsURL: String
    let blobsURL: String
    let gitTagsURL: String
    let gitRefsURL: String
    let treesURL: String
    let statusesURL: String
    let languagesURL: String
    let stargazersURL: String
    let contributorsURL: String
    let subscribersURL: String
    let subscriptionURL: String
    let commitsURL: String
    let gitCommitsURL: String
    let commentsURL: String
    let issueCommentURL: String
    let contentsURL: String
    let compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL: String
    let pullsURL: String
    let milestonesURL: String
    let notificationsURL: String
    let labelsURL: String
    let releasesURL: String
    let deploymentsURL: String
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let gitURL: String
    let sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size: Int
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let hasIssues: Bool
    let hasProjects: Bool
    let hasDownloads: Bool
    let hasWiki: Bool
    let hasPages: Bool
    let hasDiscussions: Bool
    let forksCount: Int
    let mirrorURL: String?
    let archived: Bool
    let disabled: Bool
    let openIssuesCount: Int
    let license: License?
    let allowForking: Bool
    let isTemplate: Bool
    let webCommitSignoffRequired: Bool
    let topics: [String]
    let visibility: Visibility
    let forks: Int
    let openIssues: Int
    let watchers: Int
    let defaultBranch: DefaultBranch
    let permissions: Permissions

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case repositoryDtoPrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case openIssuesCount = "open_issues_count"
        case license = "license"
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics = "topics"
        case visibility = "visibility"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
        case permissions = "permissions"
    }
}

enum DefaultBranch: String, Codable, Hashable, Sendable {
    case devtoolsApp = "devtoolsApp"
    case master = "master"
}

// MARK: - License
struct License: Codable, Hashable, Sendable {
    let key: Key
    let name: Name
    let spdxID: SpdxID
    let url: String?
    let nodeID: LicenseNodeID

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxID = "spdx_id"
        case url = "url"
        case nodeID = "node_id"
    }
}

enum Key: String, Codable, Hashable, Sendable {
    case apache20 = "apache-2.0"
    case bsd3Clause = "bsd-3-clause"
    case other = "other"
}

enum Name: String, Codable, Hashable, Sendable {
    case apacheLicense20 = "Apache License 2.0"
    case bsd3ClauseNewOrRevisedLicense = "BSD 3-Clause \"New\" or \"Revised\" License"
    case other = "Other"
}

enum LicenseNodeID: String, Codable, Hashable, Sendable {
    case mDc6TGljZW5ZZTA = "MDc6TGljZW5zZTA="
    case mDc6TGljZW5ZZTI = "MDc6TGljZW5zZTI="
    case mDc6TGljZW5ZZTU = "MDc6TGljZW5zZTU="
}

enum SpdxID: String, Codable, Hashable, Sendable {
    case apache20 = "Apache-2.0"
    case bsd3Clause = "BSD-3-Clause"
    case noassertion = "NOASSERTION"
}

// MARK: - Owner
struct Owner: Codable, Hashable, Sendable {
    let login: Login
    let id: Int
    let nodeID: OwnerNodeID
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: FollowingURL
    let gistsURL: GistsURL
    let starredURL: StarredURL
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: EventsURL
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }
}

enum EventsURL: String, Codable, Hashable, Sendable {
    case httpsAPIGithubCOMUsersGoogleEventsPrivacy = "https://api.github.com/users/google/events{/privacy}"
}

enum FollowingURL: String, Codable, Hashable, Sendable {
    case httpsAPIGithubCOMUsersGoogleFollowingOtherUser = "https://api.github.com/users/google/following{/other_user}"
}

enum GistsURL: String, Codable, Hashable, Sendable {
    case httpsAPIGithubCOMUsersGoogleGistsGistID = "https://api.github.com/users/google/gists{/gist_id}"
}

enum Login: String, Codable, Hashable, Sendable {
    case google = "google"
}

enum OwnerNodeID: String, Codable, Hashable, Sendable {
    case mdEyOk9YZ2FuaXphdGlvbjEzNDIwMDQ = "MDEyOk9yZ2FuaXphdGlvbjEzNDIwMDQ="
}

enum StarredURL: String, Codable, Hashable, Sendable {
    case httpsAPIGithubCOMUsersGoogleStarredOwnerRepo = "https://api.github.com/users/google/starred{/owner}{/repo}"
}

enum TypeEnum: String, Codable, Hashable, Sendable {
    case organization = "Organization"
}

// MARK: - Permissions
struct Permissions: Codable, Hashable, Sendable {
    let admin: Bool
    let maintain: Bool
    let push: Bool
    let triage: Bool
    let pull: Bool

    enum CodingKeys: String, CodingKey {
        case admin = "admin"
        case maintain = "maintain"
        case push = "push"
        case triage = "triage"
        case pull = "pull"
    }
}

enum Visibility: String, Codable, Hashable, Sendable {
    case visibilityPublic = "public"
}
