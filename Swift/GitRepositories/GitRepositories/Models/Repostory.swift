//
//  Repostory.swift
//  GitRepositories
//
//  Created by Locação on 01/08/22.
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id: Int
    let owner: Owner
    let name: String
    let description: String?
    let starCount: Int
    let language: String?
    let webPage: String?
    let watchers: Int
    let openIssues: Int
    let forks: Int
    let license: License?
    let created: Date
    let lastUpdated: Date

    enum CodingKeys: String, CodingKey {
        case id
        case owner
        case name
        case description
        case starCount = "stargazers_count"
        case language
        case webPage = "homepage"
        case watchers
        case openIssues = "open_issues"
        case forks
        case license
        case created = "created_at"
        case lastUpdated = "updated_at"
    }

    struct Owner: Decodable {
        let name: String
        let pictureURL: String
        let profileURL: String

        enum CodingKeys: String, CodingKey {
            case name = "login"
            case pictureURL = "avatar_url"
            case profileURL = "url"
        }
    }

    struct License: Decodable {
        let name: String?
        let url: String?
    }
}
