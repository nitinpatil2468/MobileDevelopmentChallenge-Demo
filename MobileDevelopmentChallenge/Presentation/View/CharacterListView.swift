//
//  CharactersListView.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var characterListVM: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel,movieId:String) {
        _characterListVM = StateObject(wrappedValue: viewModel)
        self.movieId = movieId
    }
    
    @State private var isLastChracter = false
    @State var movieId: String
    
    var body: some View {
        VStack{
            List(characterListVM.characters) { character in
                
                NavigationLink(destination: CharacterDetailView(
                    viewModel: ViewModelFactory(apiClient: APIClient()).createQuoteListViewModel(), character: character)) {
                        Text(character.name)
                            .font(.headline)
                            .padding(.vertical,10)
                            .id(character.id)
                            .onAppear {
                                Task{
                                    await characterListVM.loadMoreCharacters(forMovieId: movieId, characterId: character.id)
                                }
                            }
                    }
            }
        }
        .navigationTitle(TextConstants.CharacterListTitle)
        .showLoading(isLoading: $characterListVM.isLoading)
        .onAppear {
            Task {
              characterListVM.loadCharacters(forMovieId: movieId)
            }
        }
        .onDisappear{
            characterListVM.clearAllCharacters()
        }
    }
}
