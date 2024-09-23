//
//  String+.swift
//  PublicRepositories
//
//  Created by Bui Van Thuong on 23/9/24.
//

import Foundation

extension String {
    func localizedString(bundle: Bundle = Bundle.main, comment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: self, comment: comment)
    }

    var localized: String { return localizedString() }
}
