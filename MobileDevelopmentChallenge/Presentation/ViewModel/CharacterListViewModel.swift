//
//  CharacterListViewModel.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    private let getPaginatedCharactersForMovieUsecase: GetPaginatedCharactersForMovieUsecase
    @Published var characters: [CharacterDTO] = []
    @Published var errorMessage: String = ""
    @Published var showErrorAlert = false
    @Published var isLoading = false
    
    @Published var hasMoreCharacters = true
    private var currentPage = 0
    private let pageSize = 5
    
    init(getPaginatedCharactersForMovieUsecase: GetPaginatedCharactersForMovieUsecase) {
        self.getPaginatedCharactersForMovieUsecase = getPaginatedCharactersForMovieUsecase
    }
    
    func clearAllCharacters(){
        self.characters = []
    }
    
    // Load the first page of characters for a given movie
    @MainActor
    func loadCharacters(forMovieId movieId: String?){
        guard let movieId = movieId, !isLoading else { return }
        
        Task{
            do {
                isLoading = true
                let initialCharacters = try await getPaginatedCharactersForMovieUsecase.execute(forMovieId: movieId, page: 0, pageSize: pageSize)
                self.characters = initialCharacters
                self.hasMoreCharacters = initialCharacters.count == pageSize
                currentPage = 1
            } catch {
                if let error = error as? NetworkingError{
                    isLoading = false
                    errorMessage = error.userFriendlyMessage
                    showErrorAlert.toggle()
                }
            }
            isLoading = false
        }
    }
    
    // Load more characters as the user scrolls or triggers "Load More"
    @MainActor
    func loadMoreCharacters(forMovieId movieId: String?,characterId:String?) async {
        guard let movieId = movieId,
              let charId = characterId,
              characters.last?.id == charId,
              !isLoading, hasMoreCharacters else { return }
        
        Task{
            do {
                isLoading = true
                let nextPageCharacters = try await getPaginatedCharactersForMovieUsecase.execute(forMovieId: movieId, page: currentPage, pageSize: pageSize)
                if !nextPageCharacters.isEmpty {
                    characters.append(contentsOf: nextPageCharacters)
                    currentPage += 1
                    hasMoreCharacters = nextPageCharacters.count == pageSize
                } else {
                    hasMoreCharacters = false
                }
            } catch {
                if let error = error as? NetworkingError{
                    isLoading = false
                    errorMessage = error.userFriendlyMessage
                    showErrorAlert.toggle()
                }
            }
            isLoading = false
        }
    }
}
