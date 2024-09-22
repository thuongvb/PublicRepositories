//
//  ContentView.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            OrganizationView(name: "google")
        }
    }
}

#Preview {
    ContentView()
}
