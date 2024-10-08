//
//  Utilizes.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation

enum LoadMorableType: Int, Hashable {
    case loaded
    case loading
    case noMoreData
}

func infoForKey(_ key: String) -> String {
    return (Bundle.main.infoDictionary?[key] as? String)?
        .replacingOccurrences(of: "\\", with: "") ?? ""
}

