//
//  AppConfig.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation

enum AppConfig {
    enum API {
        static var endPoint: String {
            return infoForKey("API_ENDPOINT")
        }
    }
}
