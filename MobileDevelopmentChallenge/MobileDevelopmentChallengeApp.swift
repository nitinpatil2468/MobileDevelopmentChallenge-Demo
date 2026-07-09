//
//  MobileDevelopmentChallengeApp.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 29/01/25.
//

import SwiftUI

@main
struct MobileDevelopmentChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: ViewModelFactory(apiClient: APIClient()).createMovieListViewModel())
        }
    }
}
