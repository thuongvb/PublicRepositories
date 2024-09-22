//
//  APIService+URLs.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation
import Alamofire

extension APIService {
    enum Urls {
        static var host = AppConfig.API.endPoint
        static var baseUrl: String { return host }
        
        case organizationInfo(_ name: String)
        case organizationRepos(_ name: String, _ page: Int, _ perPage: Int)
    }
}

extension APIService.Urls {
    var urlString: String {
        switch self {
        case .organizationInfo(let name):
            return "\(APIService.Urls.baseUrl)/orgs/\(name)"
        case .organizationRepos(let name, _, _):
            return "\(APIService.Urls.baseUrl)/orgs/\(name)/repos"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .organizationRepos(_, let page, let perPage):
            return [
                "page": page,
                "per_page": perPage
            ]
        default:
            return nil
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .organizationInfo, .organizationRepos:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var parametersEncoding: ParameterEncoding {
        switch self {
        case .organizationRepos:
            return URLEncoding.queryString
        default:
            return URLEncoding.default
        }
    }
}
