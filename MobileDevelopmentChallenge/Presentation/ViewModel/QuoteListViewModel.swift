//
//  QuoteListViewModel.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class QuoteListViewModel: ObservableObject {
    private let getQuotesForCharacterUsecase: GetQuotesForCharacterUsecase
    @Published var quotes: [QuoteDto] = []
    @Published var errorMessage: String = ""
    @Published var showErrorAlert = false
    @Published var isLoading = false
    
    init(getQuotesForCharacterUsecase: GetQuotesForCharacterUsecase) {
        self.getQuotesForCharacterUsecase = getQuotesForCharacterUsecase
    }
    
    @MainActor
    func getQuotesForCharacter(characterId:String) {
        Task{
            do {
                isLoading = true
                let quoteDTOs = try await getQuotesForCharacterUsecase.execute(characterId: characterId)
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else{return}
                    self.quotes = quoteDTOs
                    isLoading = false
                }
            } catch {
                if let error = error as? NetworkingError{
                    isLoading = false
                    errorMessage = error.userFriendlyMessage
                    showErrorAlert.toggle()
                }
            }
        }
    }
}
