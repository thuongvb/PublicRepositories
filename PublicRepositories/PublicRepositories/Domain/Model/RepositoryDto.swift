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
    let allowForking: Bool
    let isTemplate: Bool
    let webCommitSignoffRequired: Bool
    let topics: [String]
    let visibility: String
    let forks: Int
    let openIssues: Int
    let watchers: Int
    let defaultBranch: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case repositoryDtoPrivate = "private"
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
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics = "topics"
        case visibility = "visibility"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
    }
}

extension RepositoryDto {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: RepositoryDto, rhs: RepositoryDto) -> Bool {
        lhs.id == rhs.id
    }

}

