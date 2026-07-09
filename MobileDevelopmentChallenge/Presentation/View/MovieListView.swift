//
//  MovieListView.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var movieListVM: MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        _movieListVM = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(movieListVM.movies) { movie in
                    NavigationLink(destination: CharacterListView(
                        viewModel: ViewModelFactory(apiClient: APIClient()).createCharacterListViewModel(), movieId: movie.id)) {
                            MovieCell(movie: movie)
                                .id(movie.id)
                        }
                }
                .navigationTitle(TextConstants.MovieListTitle)
                .onAppear {
                    Task{
                        movieListVM.fetchMovies()
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 8)
            }
            
            .showLoading(isLoading: $movieListVM.isLoading)
            .showAlert(isPresented: $movieListVM.showErrorAlert, title: TextConstants.AlertTitle, message: movieListVM.errorMessage)
        }
        .accentColor(.orange)
    }
}
